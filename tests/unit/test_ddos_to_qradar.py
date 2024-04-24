import os
import time
import sys
from botocore.exceptions import ClientError
from botocore.stub import Stubber
import pytest
# Resolves the package pathing explicitly so it's the same across environment.
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '../..')))
os.environ["AWS_REGION"] = "eu-west-1"
from ddos_to_qradar import ddos_lambda


@pytest.mark.parametrize(
    "aws_region, log_group_name, log_stream_name, record, sequence_token, next_token", [
        ('eu-west-1', 'ddos_qradar_cloudwatch_log_group', 'ddos_qradar_cloudwatch_log_stream', 
        'ddos_sample_message', '49610803028003650', '496108030280036512'),
    ]
)
def test_positive_write_cloudwatch_logs(aws_region, log_group_name, log_stream_name, record, sequence_token, next_token):

    os.environ["AWS_REGION"] = aws_region
    cw_stubber = Stubber(ddos_lambda.cw_logs_client)
    cw_stubber.activate()
    put_cw_params = {
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
    put_cw_response = {
        'nextSequenceToken': next_token
    }
    cw_stubber.add_response('put_log_events', put_cw_response, put_cw_params)

    response = ddos_lambda._write_cloudwatch_logs(log_group_name, log_stream_name, record, sequence_token)
    assert next_token == response['nextSequenceToken']
    cw_stubber.deactivate()
