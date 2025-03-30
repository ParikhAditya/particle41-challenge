# IAM Role for ECS Instances
resource "aws_iam_role" "ecs_instance_role" {
  name = "ecsInstanceRole"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = { Service = "ec2.amazonaws.com" }
      Action = "sts:AssumeRole"
    }]
  })
}


resource "aws_iam_role_policy_attachment" "ecs_instance_role_attach" {
  role       = aws_iam_role.ecs_instance_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
}

# ECS Cluster
resource "aws_ecs_cluster" "main" {
  name = "ecs-cluster"
}

# Instance profile for ECS Cluster nodes
resource "aws_iam_instance_profile" "ecs" {
  name = "ecs-instance-profile"
  role = aws_iam_role.ecs_instance_role.name
}

# ECS Task Definition
resource "aws_ecs_task_definition" "app" {
  family                   = "ecs-task"
  requires_compatibilities = ["EC2"]
  network_mode             = "bridge"

  container_definitions = jsonencode([{
    name      = "app-container"
    image     = "adityaparikh24/aditya-sandbox-public:particle41-challenge"
    cpu       = 256
    memory    = 512
    essential = true
    portMappings = [{
      containerPort = 8000
      hostPort      = 8000
    }]
  }])
}

# ECS Service
resource "aws_ecs_service" "app" {
  name            = "ecs-service"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.app.arn
  desired_count   = 2
  launch_type     = "EC2"
}

# SG to allow traffic to ECS instances from ALB
resource "aws_security_group" "ecs_sg" {
  name        = "ecs-sg"
  description = "Security Group for ECS Instances"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    security_groups = [aws_security_group.alb_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ecs-sg"
  }
}
