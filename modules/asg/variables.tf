variable "launch_template_id" {
  type = string
}

variable "public_subnets" {
  type = list(string)
}

variable "target_group_arn" {
  type = list(string)
}