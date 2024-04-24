""" DDOS To QRadar

A lambda function that is triggere by the DDOS CloudWatch Event:
- bsl_cetdev_logging_ddos_qradar_cloudwatch_event_rule

The JSON object passed to the lambda function contains an account id, although
does not contain the corresponding account name. To obatin the account name the
lambda function queries Organizations in the Master Admin account with the
provided account id.

The lambda function then proceeds to attemp to update

If they do not already exist the lambda function will create them.

The CloudWacth event JSON object is them posted to the above CloudWatch
Log Group and Stream.

This data is then collected by QRadar.
"""

# Standard Packages
import os
import time
import logging
import sys
# None Standard Packages but available by default within Lambda
from botocore.exceptions import ClientError
import boto3
logging.getLogger().addHandler(logging.StreamHandler(sys.stdout))
LOGGER = logging.getLogger()
""" Sets up the Lambda Logger level.
"""

LOGGER.setLevel(logging.INFO)

AWS_REGION = os.environ["AWS_REGION"]
CW_LOGS_CLIENT = boto3.client('logs', region_name=AWS_REGION)

class WriteCloudWatchLogsException(Exception):
    """Exception for WriteCloudWatchLogsException

    Args:
        Exception (dict): Error message
    """

def _write_cloudwatch_logs(log_group_name, log_stream_name, record, sequence_token=" "):
    """ Function to write logs to cloud watch log group
    Args:
        log_group_name - dict: Log Group Name
        log_stream_name - dict: Log Stream Name
        record - dict: ddos_message
        sequence_token - dict: Null value
    return:
        record - dict: Log Response
    """
    put_success = True
    while put_success:
        try:
            kwargs = {
                'logGroupName': log_group_name,
                'logStreamName': log_stream_name,
                'logEvents': [
                    {
                        'timestamp': int(round(time.time() * 1000)),
                        'message': record
                    },
                    ],
                'sequenceToken' : sequence_token
                }
            put_log_response = CW_LOGS_CLIENT.put_log_events(**kwargs)
            put_success = False

            if "rejectedLogEventsInfo" in put_log_response:
                LOGGER.error(
                    """Error while performing Put log event: %s
                    """, put_log_response["rejectedLogEventsInfo"])
            else:
                LOGGER.info(put_log_response)
            if not put_success:
                return put_log_response

        except ClientError as exc:
            if exc.response["Error"]["Code"] == 'InvalidSequenceTokenException':
                sequence_token = exc.response['expectedSequenceToken']
            else:
                LOGGER.error(exc)
                raise WriteCloudWatchLogsException("Client Error Occured, Failed")

def lambda_handler(event, _context_):
    """ Lambda Handler for CloudWatch Log Group and Stream

    Args:
        event - dict: CloudWatch Event

    return:
        record - dict: CloudWatch JSON object

    """
    #Specify the Log group name if its different
    LOGGER.info("""
            Environment Variables of Lambda are:
            LOG_GROUP_FULL_NAME: %s
            LOG_STREAM_FULL_NAME: %s
            """, os.environ['LOG_GROUP_FULL_NAME'], os.environ['LOG_STREAM_FULL_NAME'])

    LOGGER.info("Received event: %s ", event)
    ddos_message = event['Records'][0]['Sns']['Message']

    log_group_name = os.environ['LOG_GROUP_FULL_NAME']
    log_stream_name = os.environ['LOG_STREAM_FULL_NAME']

    _write_cloudwatch_logs(log_group_name, log_stream_name, ddos_message)
    