output "alb_dns_name" {
  value       = "http://${aws_lb.web_alb.dns_name}"
  description = "Public URL of the Application Load Balancer"
}
