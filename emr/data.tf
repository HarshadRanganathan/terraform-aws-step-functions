data "aws_caller_identity" "current" {}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    region = var.region
    bucket = format("%s-%s-terraform-state", var.namespace, var.stage)
    key    = format("%s/vpc/terraform.tfstate", var.stage)
  }
}


# Step function  This is access to Step Function itself

data "terraform_remote_state" "iam_role" {
  backend = "s3"

  config = {
    region = "us-east-1"
    bucket = format("%s-%s-terraform-state", var.namespace, var.stage)
    key    = format("%s/iam/roles/emr/terraform.tfstate", var.stage)
  }
}

data "template_file" "stepfunction_template_json" {
  template = file("${path.module}/templates/${var.template_file_name}")
  vars = {
    emr_name     = "${var.namespace}-${var.stage}-${var.emr_name}"
    account_id   = data.aws_caller_identity.current.account_id
    stage        = var.stage
    namespace    = var.namespace
    region       = var.region
    vpc_subnet_1 = data.terraform_remote_state.vpc.outputs.private_subnets[0]
    vpc_subnet_2 = data.terraform_remote_state.vpc.outputs.private_subnets[1]
    vpc_subnet_3 = data.terraform_remote_state.vpc.outputs.private_subnets[2]
    kafka_bootstrap_servers = var.kafka_bootstrap_servers
  }
}
