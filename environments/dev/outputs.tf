output "dns_name" {
  value = "http://${module.alb.alb_dns_name}"
}