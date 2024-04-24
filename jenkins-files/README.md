# Jenkins

## Jenkins Pipelines locations

* [Cloud Engineering/Jenkins/Dev/Security Services Space](https://cjcm-cet.660474218557.ew2.aws.prod.r53:8443/job/Cloud_Engineering/job/Dev/job/AWS/job/security_services/job/aws_ddos_to_qradar/)

* [Cloud Engineering/Jenkins/Test/Security Services Space](https://cjcm-cet.660474218557.ew2.aws.prod.r53:8443/job/Cloud_Engineering/job/Test/job/AWS/job/security_services/job/aws_ddos_to_qradar/)

* [Cloud Engineering/Jenkins/Master/Security Services Space](https://cjcm-cet.660474218557.ew2.aws.prod.r53:8443/job/Cloud_Engineering/job/Master/job/AWS/job/security_services/job/aws_ddos_to_qradar/)

## aws-ddos-to-qradar.deploy.Jenkinsfile

This jenkins pipeline deploys the DDOS To QRadar service to AWS.

### Job Configuration

| Parameter Type | Parameter Name | Default Value |
|--------|---------|---------|
| String | aws_admin_account_name | AWS-BSL-{environment}-ADMIN|
| String | aws_logging_account_name | AWS-BSL-LOGGING-{environment} |
| String | branch_name | {corresponding environment branch} |
| choice | terraform_action | plan,apply,destroy |
| choice | terraform_include_logging_global_service | false,true |
| choice | terraform_include_logging_regional_service | false,true |
| Hidden | aws_org_role | bsl-{organization}-admin-fulladmin-adfs-role |
| Hidden | terraform_path | /abcd/jenkins/tools/terraform/terraform_0.11.7 |
| Choice | aws_region | |
