terraform {
  backend "s3" {
    bucket         = "YOUR_BOOTSTRAP_BUCKET_NAME"
    key            = "eks-backstage-platform/terraform.tfstate"
    region         = "eu-west-2"
    dynamodb_table = "eks-backstage-tf-locks"
    encrypt        = true
  }
}
