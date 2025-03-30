# LT
resource "aws_launch_template" "ecs" {
  name          = "ecs-template"
  image_id      = data.aws_ami.ecs_optimized.id
  instance_type = "t3a.medium"

  iam_instance_profile {
    name = aws_iam_instance_profile.ecs.name
  }

  network_interfaces {
    security_groups = [aws_security_group.ecs_sg.id]
  }

  user_data = base64encode(<<EOF
#!/bin/bash
echo ECS_CLUSTER=${aws_ecs_cluster.main.name} >> /etc/ecs/ecs.config
EOF
  )
}