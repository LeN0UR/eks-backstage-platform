# What provider.tf is meant to be for? It's for configuring how Terraform talks to an external system.
# https://developer.hashicorp.com/terraform/language/providers/requirements

# https://developer.hashicorp.com/terraform/language/block/provider?utm_source=chatgpt.com



provider "aws" {
  region = "eu-west-2"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.23.0"
    }
  }
}
