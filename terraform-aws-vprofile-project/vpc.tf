module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.VPC_NAME
  Cidr = var.VpcCidr

  azs             = [var.Zone1, var.Zone2, var.Zone3]
  private_subnets = [var.PrivSub1Cidr, var.PrivSub2Cidr, var.PrivSub3Cidr]
  public_subnets  = [var.PubSub1Cidr, var.PubSub2Cidr, var.PubSub3Cidr]

  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Terraform   = "true"
    Environment = "Prod"
  }

  vpc_tags = {
    Name = var.VPC_NAME
  }
}
