# AWS Region
aws_region = "us-east-1" 
# VPC Configuration
vpc_cidr_block = "10.0.0.0/16"
vpc_name       = "Main-VPC"

# Subnet 1 Configuration
subnet_1_cidr_block = "10.0.0.0/24"
subnet_1_az         = "us-east-1a"
subnet_1_name       = "Subnet-1"

# Subnet 2 Configuration
subnet_2_cidr_block = "10.0.1.0/24"
subnet_2_az         = "us-east-1b"
subnet_2_name       = "Subnet-2"

# Internet Gateway
igw_name = "Main-IGW"

# Route Table
route_table_name = "Main-RTB"

# Security Group
sg_name = "Main-SG"

# S3 Bucket
s3_bucket_name = "main-s3"

# Instance Configuration
ami_id         = "ami-1234567890abcdef0"
instance_type  = "t2.micro"

# Web Server Names
webserver_1_name = "WebServer-1"
webserver_2_name = "WebServer-2"

# ALB Configuration
alb_name                = "Main-ALB"
alb_target_group_name    = "Main-ALB-Target"
alb_listener_name        = "Main-ALB-Listener"
