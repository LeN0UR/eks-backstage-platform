terraform {
  backend "s3" {
    bucket         = "backstage"
    key            = "eks-backstage-platform/terraform.tfstate"
    region         = "eu-west-2"
    dynamodb_table = "eks-backstage-tf-locks"
    encrypt        = true
  }
}

