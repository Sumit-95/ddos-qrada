terraform_dir := terraform/

terraform_modules := modules/cloudwatch_event/ \
	 				 modules/cloudwatch_log_group/ \
					 modules/iam_admin/ \
					 modules/iam_logging/ \
					 modules/lambda_function/ \
					 services/logging_account/ \
					 services/tenant_accounts/regional_resources/ \
					 services/tenant_accounts/common_resources/ \

all: terraform-fmt terraform-docs pylint

terraform-fmt:
	@echo "Performing a Terraform format"
	terraform fmt terraform/

terraform-docs:
	@echo ""
	@echo "Updating Terraform Module Documentation"
	for i in $(terraform_modules); do \
		echo "Updating README" $(terraform_dir)/$$i; \
		terraform-docs markdown $(terraform_dir)/$$i > $(terraform_dir)/$$i/README.md; \
		printf "\n\n## hcl .tfvars file format\n\n" >> $(terraform_dir)/$$i/README.md; \
		terraform-docs tfvars hcl $(terraform_dir)/$$i >> $(terraform_dir)/$$i/README.md; \
	done;

pylint:
	@echo ""
	@echo "Performing pylint on python modules"
	pylint helpers/
	@echo "Performing pylint on the lambda function"
	pylint ddos_to_qradar/