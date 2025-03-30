# Output for ALB URL
output "alb_url" {
  description = "Application Load Balancer URL"
  value       = <<EOT
Your application is accessible at: http://${aws_lb.ecs_alb.dns_name}

Note: The service/task may take a few minutes to be admitted to the ECS cluster. Please wait and refresh if it doesn't respond immediately.
EOT
}