variable "domain_name" {
  description = "Root domain name (e.g. nourdemo.com)"
  type        = string
}

variable "app_domain_name" {
  description = "Application domain (e.g. eks.nourdemo.com)"
  type        = string
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
}