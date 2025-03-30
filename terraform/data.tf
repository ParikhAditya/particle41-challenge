# Fetch AMI details
data "aws_ssm_parameter" "ecs_optimized_ami" {
  name  = "/aws/service/ecs/optimized-ami/amazon-linux-2/recommended/image_id"
}

# Fetch AMI ID from details
data "aws_ami" "ecs_optimized" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "image-id"
    values = [data.aws_ssm_parameter.ecs_optimized_ami.value]
  }
}
