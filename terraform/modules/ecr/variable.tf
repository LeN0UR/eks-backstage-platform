variable "repository_name" {
  description = "Name of the ECR repository"
  type        = string
}

variable "max_image_count" {
  description = "Maximum number of images to keep in the repository"
  type        = number
  default     = 10
}

variable "tags" {
  description = "Tags applied to the ECR repository"
  type        = map(string)
  default     = {}
}
