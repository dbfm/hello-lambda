module "hello_lambda" {
  source  = "terraform-aws-modules/lambda/aws"
  version = "~> 3.3.1"

  function_name                     = "hello-${terraform.workspace}"
  handler                           = "index.handler"
  runtime                           = "nodejs14.x"
  create_lambda_function_url        = true
  use_existing_cloudwatch_log_group = false
  cloudwatch_logs_retention_in_days = 1
  source_path = [
    "${path.module}/../src/index.js"
  ]
}
