terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      # version

    }
  }
  #required_version = ">=1.1.1"

  backend "s3" {
    bucket = "bas-bucket-box"
    key    = "ecs_ext"
    region = "eu-west-2"
  }

}

provider "aws" {
  #version
  region = "eu-west-2"
}

module "common_vpc" {
  source = "./modules/vpc/"

  public_subnets_cidr  = var.public_subnets_cidr
  private_subnets_cidr = var.private_subnets_cidr
  vpc_cidr             = var.vpc_cidr
}
