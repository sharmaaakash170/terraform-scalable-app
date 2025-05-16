# ========= Security Group====================

resource "aws_security_group" "web_sg" {
  name = "web-sg"
  description = "Allow HTTP" 
  vpc_id = var.vpc_id
}

resource "aws_security_group_rule" "allsow_ssh" {
  type = "ingress"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  cidr_blocks = [ "0.0.0.0/0" ]
  security_group_id = aws_security_group.web_sg.id
}

resource "aws_security_group_rule" "allow_http" {
  type = "ingress"
  from_port = 80
  to_port = 80
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.web_sg.id
  protocol = "tcp"
}

resource "aws_security_group_rule" "egress" {
  type = "egress"
  from_port = 0
  to_port = 0
  protocol = "-1"
  cidr_blocks = [ "0.0.0.0/0" ]
  security_group_id = aws_security_group.web_sg.id
}

# ========== EC2 Template ==================

resource "aws_launch_template" "web_launch_template" {
  name_prefix = "web-lt-"
  image_id = var.ami_id
  instance_type = var.instance_type
  network_interfaces {
    associate_public_ip_address = true
    security_groups = [ aws_security_group.web_sg.id ]
  }
  user_data = base64encode(file("${path.module}/user-data.sh"))
}

