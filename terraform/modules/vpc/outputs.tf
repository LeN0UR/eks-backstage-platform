output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.main.id
}

output "public_subnet_ids" {
  description = "IDs of public subnets"
  value = [
    aws_subnet.public_az1.id,
    aws_subnet.public_az2.id
  ]
}

output "private_subnet_ids" {
  description = "IDs of private subnets"
  value = [
    aws_subnet.private_az1.id,
    aws_subnet.private_az2.id
  ]
}

output "availability_zones" {
  description = "Availability zones used by the VPC"
  value       = var.availability_zones
}
