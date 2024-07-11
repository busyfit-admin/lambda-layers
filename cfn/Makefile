AWS_REGION?=ap-south-1
ENVIRONMENT?=dev
TEMPLATE := template.yaml
STACK_NAME := lambda-layers-$(ENVIRONMENT)


# stack tag values
DEPARTMENT := "CLOUD DEVOPS"
PROJECT := "Lambda Layers"
PROVISIONER := "CloudFormation"

build:
 
deploy: 

	$(eval AWS_ACCOUNT := $(shell aws sts get-caller-identity --query Account --output text ) )
	$(eval CFN_BUCKET := artifactory-$(AWS_REGION)-$(AWS_ACCOUNT))
	echo Deploying to environment $(ENVIRONMENT) from bucket $(CFN_BUCKET) 
	aws cloudformation package \
		--template-file $(TEMPLATE) \
		--s3-bucket $(CFN_BUCKET) \
		--s3-prefix $(STACK_NAME) \
		--output-template-file rendered.yml
	aws cloudformation deploy \
		--template-file rendered.yml \
		--stack-name $(STACK_NAME) \
		--s3-bucket $(CFN_BUCKET) \
		--capabilities CAPABILITY_IAM CAPABILITY_AUTO_EXPAND CAPABILITY_NAMED_IAM \
		--parameter-overrides Environment=$(ENVIRONMENT) \
			$$( cat params-$(ENVIRONMENT).txt 2>/dev/null ) \
		--no-fail-on-empty-changeset \
		--tags app:governance:department=$(DEPARTMENT) \
			app:governance:project=$(PROJECT) \
			app:governance:environment=$(ENVIRONMENT) \
			app:governance:provisioner=$(PROVISIONER)


.PHONY: build deploy