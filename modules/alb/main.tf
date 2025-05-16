# Application Load Balancer Security Group

resource "aws_security_group" "alb_sg" {
  name = "alb-sg"
  description = "Allow HTTP to ALB"
  vpc_id = var.vpc_id
}

resource "aws_security_group_rule" "allow_http" {
  type = "ingress"
  from_port = 80
  to_port = 80
  cidr_blocks = [ "0.0.0.0/0" ]
  protocol = "tcp"
  security_group_id = aws_security_group.alb_sg.id
}

resource "aws_security_group_rule" "egress" {
  type = "egress"
  from_port = 0
  to_port = 0
  cidr_blocks = [ "0.0.0.0/0" ]
  protocol = "-1"
  security_group_id = aws_security_group.alb_sg.id
}

# Application Load Balancer

resource "aws_alb" "web_alb" {
  name = "web-alb"
  load_balancer_type = "application"
  subnets = var.public_subnets 
  security_groups = [ aws_security_group.alb_sg.id ]
}

resource "aws_alb_target_group" "tg" {
  name = "web-tg"
  port = 80
  protocol = "HTTP"
  vpc_id = var.vpc_id
  target_type = "instance"
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_alb.web_alb.arn
  port = 80 
  protocol = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_alb_target_group.tg.arn
  }
}