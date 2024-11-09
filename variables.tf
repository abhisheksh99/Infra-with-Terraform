# AWS Region configuration
variable "aws_region" {
  description = "The AWS region where the resources will be created"
  type        = string
  default     = "us-east-1"  # You can change this to your desired region
}

# VPC configuration
variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
  default     = "Main-VPC"
}

# Subnet 1 configuration
variable "subnet_1_cidr_block" {
  description = "CIDR block for Subnet 1"
  type        = string
  default     = "10.0.0.0/24"
}

variable "subnet_1_az" {
  description = "Availability Zone for Subnet 1"
  type        = string
  default     = "us-east-1a"
}

variable "subnet_1_name" {
  description = "Name for Subnet 1"
  type        = string
  default     = "Subnet-1"
}

# Subnet 2 configuration
variable "subnet_2_cidr_block" {
  description = "CIDR block for Subnet 2"
  type        = string
  default     = "10.0.1.0/24"
}

variable "subnet_2_az" {
  description = "Availability Zone for Subnet 2"
  type        = string
  default     = "us-east-1b"
}

variable "subnet_2_name" {
  description = "Name for Subnet 2"
  type        = string
  default     = "Subnet-2"
}

# Internet Gateway
variable "igw_name" {
  description = "Name for the Internet Gateway"
  type        = string
  default     = "Main-IGW"
}

# Route Table
variable "route_table_name" {
  description = "Name for the Route Table"
  type        = string
  default     = "Main-RTB"
}

# Security Group
variable "sg_name" {
  description = "Name for the Security Group"
  type        = string
  default     = "Main-SG"
}

# S3 Bucket
variable "s3_bucket_name" {
  description = "Name for the S3 bucket"
  type        = string
  default     = "mains3"
}

# Instance Configuration
variable "ami_id" {
  description = "AMI ID for instances"
  type        = string
  default     = "ami-0261755bbcb8c4a84"
}

variable "instance_type" {
  description = "Instance type for web servers"
  type        = string
  default     = "t2.micro"
}

# Web Server Names
variable "webserver_1_name" {
  description = "Name for Web Server 1"
  type        = string
  default     = "WebServer-1"
}

variable "webserver_2_name" {
  description = "Name for Web Server 2"
  type        = string
  default     = "WebServer-2"
}

# ALB Configuration
variable "alb_name" {
  description = "Name for the ALB"
  type        = string
  default     = "Main-ALB"
}

variable "alb_target_group_name" {
  description = "Name for the ALB target group"
  type        = string
  default     = "Main-ALB-Target"
}

variable "alb_listener_name" {
  description = "Name for the ALB listener"
  type        = string
  default     = "Main-ALB-Listener"
}
