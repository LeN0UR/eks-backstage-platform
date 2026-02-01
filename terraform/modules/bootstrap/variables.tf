variable "region" {
  description = "AWS region for bootstrap resources"
  type        = string
  default     = "eu-west-2"
}

variable "state_bucket_name" {
  description = "Name of the S3 bucket used for Terraform remote state"
  type        = string
  default     = "backstage-state-bucket"
}

variable "lock_table_name" {
  description = "Name of the DynamoDB table used for Terraform state locking"
  type        = string
  default     = "terraform-locks"
}
