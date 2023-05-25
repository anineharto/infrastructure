az account set --subscription $AZURE_SUBSCRIPTION_ID
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply -var "var=test"