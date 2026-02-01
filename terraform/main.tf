module "vpc" {
  source = "./modules/vpc"

  vpc_cidr             = "10.0.0.0/16"
  availability_zones   = ["eu-west-2a", "eu-west-2b"]
  public_subnet_cidrs  = ["10.0.0.0/20", "10.0.16.0/20"]
  private_subnet_cidrs = ["10.0.32.0/20", "10.0.48.0/20"]

  tags = {
    Name    = "backstage"
    Project = "eks-backstage"
  }
}
