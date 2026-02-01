# eks-backstage-platform

Production-style deployment of an Internal Developer Portal (Backstage) on AWS EKS using Terraform, GitOps with ArgoCD, secure CI/CD, automated DNS/TLS, and full cluster observability. i will be focusing on updating this readme at a later stage.

# Debugging log
(Summary of issues I ran while building this project, and their solutions)


# VPC MODULE

run your worker nodes in private subnets only
worker nodes do not need to be reachable from the internet and putting them in public subnets increase attack surface
weakens security.
  
Public subnets are for entry points.
Private subnets are for workloads.

✅ Correct VPC Summary (Clean & Accurate)


Summary – VPC Configuration 🎯

✅ VPC: 10.0.0.0/16 with 4 subnets across 2 Availability Zones (lean, portfolio-friendly)
✅ Public Subnets: 2 (one per AZ) for Internet Gateway + NAT Gateways
✅ Private Subnets: 2 (one per AZ) for EKS node placement
✅ NAT Gateways: 2 (AZ-aligned, high-availability outbound access)
✅Route Tables: 3 total (1 public, 2 private)

1 public route table
Associated with both public subnets
Default route → Internet Gateway

2 private route tables

One per AZ
Each associated with one private subnet
Default route → corresponding NAT Gateway

vpc end points?