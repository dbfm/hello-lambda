# hello-lambda
A simple "hello" lambda function with a public URL which returns a JSON payload.

Each deployment of the lambda has its own log group in cloudwatch for observability.

Hit [https://wbb33tku2ucrb4ietdl4rc5wue0mvjqz.lambda-url.eu-west-2.on.aws/](https://wbb33tku2ucrb4ietdl4rc5wue0mvjqz.lambda-url.eu-west-2.on.aws/) to see it in action.

This project is a POC that will need some refinement before use in production.
See [Needs Impovement](#needs-improvement) for details.

# Repo structure

```
├── deployment     // Terraform config for lambda deployment.
├── prerequisites  // Terraform config for state bucket and lock table.
└── src            // Lambda source code.
```

# CI/CD Functionality

The repo is designed to operate with trunk based development.

A PR raised against this repo which makes changes to either the terraform
configuration, or the lambda source code will result in "review app" style functionality, where a copy of the lambda will be deployed, sufixed by the
branch name from which the PR is raised.

On merge, the "hello-main" lambda will be deployed/updated.

The URL through which the lambda can be triggered is output by the terraform
 configuration

# Needs Improvement

## Pretty urgent
 - The review app lambda's are never destroyed.
 - The main branch is not protected.
 - No PR approval process.
 - No 'smoke test' to validate that the lambda actually functions as intended. A quick 'curl' in the pipeline would be better than the nothing we currently have.
 - No linting/testing of terraform or lambda code.
 - No authentication required to trigger the lambda
 - No ingress security, Cloudflare, WAF, IP whitelist etc.

## Would be nice
- Post the lambda_function_url back to the PR, to save users having to dig through the logs or look in the AWS console to find it.
- A more flexible ingress layer, api-gateway, something in k8s, to get the amazon references out of the URL and maybe allow versioning of the endpoint.
- Use pre-existing state storage/locking to remove the need for 'prerequisites'
