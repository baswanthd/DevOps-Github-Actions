variable "region" {
  default = "eu-central-1"
}

variable "vpc_cidr" {}

variable "public_subnets_cidr" {}

variable "private_subnets_cidr" {}

variable "availability_zones" {
  default = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
}

variable "dns_zone_id" {
  description = "DNS zone id for the services e.g test.baswanth-tech.de"
  default     = "Z03704902NJW3IC1VEZPZ"
}

variable "dns_name_bmi" {
  description = ""
  default     = "bmi.test.baswanth-tech.de"
}

variable "dns_name_contacts" {
  description = ""
  default     = "contacts.test.baswanth-tech.de"
}

# variable "execution_role_arn" {
#   description = ""
#   default     = "arn:aws:iam::124937358799:role/ecsTaskExecutionRole"
# }
