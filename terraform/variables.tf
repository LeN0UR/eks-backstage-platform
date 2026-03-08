# VPC

variable "vpc_cidr" {
  type = string
}

variable "availability_zones" {
  type = list(string)
}

variable "public_subnet_cidrs" {
  type = list(string)
}

variable "private_subnet_cidrs" {
  type = list(string)
}

# IAM

variable "cluster_role_name" {
  type = string
}

variable "node_role_name" {
  type = string
}

# EKS

variable "cluster_name" {
  type = string
}

variable "instance_types" {
  type = list(string)
}

variable "node_desired_size" {
  type = number
}

variable "node_min_size" {
  type = number
}

variable "node_max_size" {
  type = number
}

# ECR

variable "repository_name" {
  type = string
}

variable "max_image_count" {
  type = number
}

# Route53

variable "domain_name" {
  type = string
}

variable "app_domain_name" {
  type = string
}

# Global

variable "tags" {
  type = map(string)
}