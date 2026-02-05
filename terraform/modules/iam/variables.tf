variable "tags" {
  description = "Tags applied to IAM resources"
  type        = map(string)
  default     = {}
}

variable "cluster_role_name" {
  description = "Name of the EKS cluster IAM role"
  type        = string
  default     = "eks-cluster-role"
}

variable "node_role_name" {
  description = "Name of the EKS node group IAM role"
  type        = string
  default     = "eks-node-group-role"
}
