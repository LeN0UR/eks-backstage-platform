output "cluster_name" {
  value       = aws_eks_cluster.this.name
  description = "EKS cluster name"
}

output "cluster_endpoint" {
  value       = aws_eks_cluster.this.endpoint
  description = "EKS API endpoint"
}

output "cluster_certificate_authority" {
  value       = aws_eks_cluster.this.certificate_authority[0].data
  description = "Base64 encoded cluster CA"
}

output "node_group_name" {
  value       = aws_eks_node_group.default.node_group_name
  description = "Default EKS node group name"
}
