az account set --subscription $AZURE_SUBSCRIPTION_ID
terraform init
terraform fmt
terraform validate
terraform plan -var-file="prod.tfvars"
terraform apply