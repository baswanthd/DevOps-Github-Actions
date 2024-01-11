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
  subnets          = module.common_vpc.private_subnet_ids
  execution_role_arn = "arn:aws:iam::124937358799:role/ecsTaskExecutionRole"
  fargate_sg = aws_security_group.fargate-sg.id
  lb_target_group = aws_lb_target_group.central-app-tg.arn
  contact_form_tg = aws_lb_target_group.contact-form-tg.arn
 
 # lb_listner = aws_lb_listener.central-app-listner.arn
}