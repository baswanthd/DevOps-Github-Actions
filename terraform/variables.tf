# variable "subnets" {
# description = "subnets for FARGATE"
# }

variable "region" {
  default = "eu-central-1"
}

variable "vpc_cidr" {

}

variable "public_subnets_cidr" {

}

variable "private_subnets_cidr" {

}

variable "availability_zones" {
  default = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
}

# variable "cluster_id" {
#   default = aws_ecs_cluster.central-cluster.id
# }