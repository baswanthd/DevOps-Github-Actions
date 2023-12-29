# variable "subnets" {
# description = "subnets for FARGATE"
# }

variable "region" {
    default = "eu-west-2"
}

variable "vpc_cidr" {
    
}

variable "public_subnets_cidr" {
    
}

variable "private_subnets_cidr" {
    
}

variable "availability_zones" {
    default = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
}