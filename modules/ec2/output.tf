output "web_launch_template_id" {
  value = aws_launch_template.web_launch_template.id
}

output "security_group_id" {
  value = aws_security_group.web_sg.id
}