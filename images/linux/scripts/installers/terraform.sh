#!/bin/bash
################################################################################
##  File:  terraform.sh
##  Team:  CI-Platform
##  Desc:  Installs terraform
################################################################################

## Source the helpers for use with the script
source $HELPER_SCRIPTS/document.sh
source $HELPER_SCRIPTS/apt.sh

# Install Terraform
TERRAFORM_VERSION=$(curl -s https://checkpoint-api.hashicorp.com/v1/check/terraform | jq -r .current_version)
curl -LO "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip"
unzip "terraform_${TERRAFORM_VERSION}_linux_amd64.zip" -d /usr/local/bin
rm -f "terraform_${TERRAFORM_VERSION}_linux_amd64.zip"

## Document what was added to the image
echo "Lastly, documenting what we added to the metadata file"
DocumentInstalledItem "Terraform"
