module "vpc" {
  source = "../../modules/vpc"
  azs = var.azs 
  cidr_block = var.cidr_block
}

module "ec2" {
  source = "../../modules/ec2"
  ami_id = var.ami_id
  instance_type = var.instance_type 
  vpc_id = module.vpc.vpc_id
  depends_on = [ module.vpc ]
}

module "alb" {
  source = "../../modules/alb"
  public_subnets = module.vpc.public_subnets
  vpc_id = module.vpc.vpc_id
  depends_on = [ module.vpc ]
}

module "asg" {
  source = "../../modules/asg"
  launch_template_id = module.ec2.web_launch_template_id
  target_group_arn = [module.alb.target_group_arn]
  public_subnets = module.vpc.public_subnets
}

output "alb_dns" {
  value = module.alb.alb_dns_name
}

