## Terraform code to provision infrastructure for the python app

This directory contains terraform code to provision an ECS cluster that will run the python app as an ECS service.
It also provisions a VPC, an ALB and necessary components to make it all work.

### To initialize terraform 
1. Run `terraform init`

### To validate terraform code
1. Run `terraform validate`

### To generate a plan
1. Run `terraform plan`

### To create resources
1. Run `terraform apply` and then `yes` when prompted for input. To run without needing input, pass this flag - `--auto-approve`

### To destroy created resources
1. Run `terraform destroy` and then `yes` when prompted for input. To run without needing input, pass this flag - `--auto-approve`

`sample-iam-permissions` has a general list of permissions you'll need to provision and destroy the resources via terraform. 
The list may include extra stuff, you can trim it down if needed.

Below is a list of AWS Resources that will be created - 

- VPC
    - VPC
    - Public Subnets
    - Private Subnets
    - Internet Gateway
    - NAT Gateway
    - Route Tables
    - Route Table Associations

- ECS
    - ECS Cluster
    - ECS Task Definition
    - ECS Service
    - IAM roles, policies for ECS instance profile
    - Security groups
    - Autoscaling Group
    - Application Load Balancer with Target Group (with ASG as attachment)