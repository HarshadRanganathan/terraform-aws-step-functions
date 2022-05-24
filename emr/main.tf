terraform {
  backend "s3" {}
}

# Create step function

## Step Function

module "stepfunction" {
  source    = "git::https://github.com/HarshadRanganathan/terraform-aws-module-msk.git//module?ref=1.0.0"
  enabled   = var.enabled
  region    = var.region
  namespace = var.namespace
  stage     = var.stage
  name      = "${var.namespace}-${var.stage}-${var.sf_name}"

  role_arn       = data.terraform_remote_state.iam_role.outputs.role_arn
  sfn_definition = data.template_file.stepfunction_template_json.rendered

  tags = var.tags
}
