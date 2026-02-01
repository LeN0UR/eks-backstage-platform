# eks-backstage-platform

Production-style deployment of an Internal Developer Portal (Backstage) on AWS EKS using Terraform, GitOps with ArgoCD, secure CI/CD, automated DNS/TLS, and full cluster observability. i will be focusing on updating this readme at a later stage.

# Debugging log
(Summary of issues I ran while building this project, and their solutions)
(Forgot that s3 bucket names had to be lowercase)
(Initially did not set the name values for my bucket and dynamodb so the plan kept asking me for values. Added default values to solve this)
