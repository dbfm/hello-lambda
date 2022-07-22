This configuration defines an s3 bucket and dynamodb table for state storage
and locking. Since this is the configuration that creates the state storage
bucket, the state file for this configuration is held in git.

```
terraform {
  backend "s3" {
    bucket         = "hello-lambda-tfstate"
    key            = "??/??/terraform.tfstate"
    region         = "eu-west-2"
    dynamodb_table = "hello-lambda-tfstate"
    encrypt        = true
  }
}
```
