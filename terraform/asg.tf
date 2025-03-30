# ASG
resource "aws_autoscaling_group" "ecs" {
  vpc_zone_identifier  = [aws_subnet.private_1.id, aws_subnet.private_2.id]
  desired_capacity     = 1
  min_size            = 1
  max_size            = 2
  launch_template {
    id      = aws_launch_template.ecs.id
    version = "$Latest"
  }
}

# Attach ASG to ALB TG
resource "aws_autoscaling_attachment" "ecs_asg_attachment" {
  autoscaling_group_name = aws_autoscaling_group.ecs.name
  lb_target_group_arn    = aws_lb_target_group.ecs_tg.arn
}
