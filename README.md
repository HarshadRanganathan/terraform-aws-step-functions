# terraform-aws-step-functions

## Setup/Teardown Commands

```
terraform init -backend-config="environments/prod/prod.backend.tfvars"
terraform plan -var-file="environments/shared.tfvars" -var-file="environments/prod/prod.tfvars"
terraform apply -var-file="environments/shared.tfvars" -var-file="environments/prod/prod.tfvars"
terraform destroy -var-file="environments/shared.tfvars" -var-file="environments/prod/prod.tfvars"
```
