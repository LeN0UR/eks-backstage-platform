# eks-backstage-platform

Production-style deployment of an Internal Developer Portal (Backstage) on AWS EKS, using Terraform, GitOps with ArgoCD, secure CI/CD pipelines, automated DNS and TLS, and cluster observability.

This project focuses on **infrastructure design, correctness, and clarity** over rushing deployments.  
The README will be expanded as the platform evolves.

---

## Debugging Log

A short record of key issues encountered and how they were resolved while building the foundation.

- **S3 constraints**  
  S3 bucket names must be lowercase. Missing or mismatched bucket names caused early backend issues.

- **Terraform backend bootstrapping**  
  S3 backends require the bucket to exist before `terraform init`. Solved by introducing a separate bootstrap module using local state.

- **Local vs remote state**  
  Used a local backend during active development to allow `init`, `validate`, and `plan` without S3/DynamoDB. Local state still fully supports `apply`.

- **Module inputs**  
  `Unsupported argument` errors were caused by variables being passed to modules without being declared inside the module’s `variables.tf`.

- **Variable loading**  
  Terraform only auto-loads `terraform.tfvars` and `*.auto.tfvars`. Misnamed files caused interactive prompts.

- **Provider region**  
  Resources defaulted to `us-west-2` due to environment configuration. Fixed by explicitly setting the AWS provider region.

- **Cost awareness**  
  The VPC design includes NAT Gateways, so infrastructure was validated using `terraform plan` only to avoid unnecessary costs.

---
