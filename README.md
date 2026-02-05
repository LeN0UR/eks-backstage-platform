# eks-backstage-platform

Production-style deployment of an Internal Developer Portal (Backstage) on AWS EKS using Terraform, GitOps with ArgoCD, secure CI/CD, automated DNS/TLS, and full cluster observability. i will be focusing on updating this readme at a later stage.

# Debugging log
(Summary of issues I ran while building this project, and their solutions)
(Forgot that s3 bucket names had to be lowercase)
(Initially did not set the name values for my bucket and dynamodb so the plan kept asking me for values. Added default values to solve this)
Terraform backend: S3 backends require the bucket to exist before terraform init. Solved via a separate bootstrap module using local state.

Local vs remote state: Used a local backend during development to allow init, validate, and plan without needing S3/DynamoDB. Local backend still supports apply.

Module inputs: Unsupported argument errors came from missing variables in the module itself. Module inputs must be declared in the module’s variables.tf.

Variable loading: Terraform only auto-loads terraform.tfvars and *.auto.tfvars. Missing or misnamed files cause interactive prompts.

Provider region: Resources defaulted to us-west-2 due to environment settings. Fixed by explicitly setting the AWS provider region.

Cost awareness: VPC includes NAT Gateways, so infrastructure was validated with terraform plan only to avoid unnecessary cost.
