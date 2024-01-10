terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      # version

    }
  }
  #required_version = ">=1.1.1"

  backend "s3" {
    bucket = "github-action-buc"
    key    = "ecs_central"
    region = "eu-central-1"
  }

}

provider "aws" {
  #version
  region = "eu-central-1"
}

module "common_vpc" {
  source = "./modules/vpc/"

  public_subnets_cidr  = var.public_subnets_cidr
  private_subnets_cidr = var.private_subnets_cidr
  vpc_cidr             = var.vpc_cidr
}

module "ecs" {
  source = "./modules/ecs/"

  cluster  = var.cluster_id
}