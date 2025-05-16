variable "aws_region" {
  type = string
}

variable "azs" {
  type = list(string)
}

variable "cidr_block" {
  type = string
}

variable "ami_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "aws_ecr_repository_name" {
  type = string
}


