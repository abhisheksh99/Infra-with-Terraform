# Output the VPC ID
output "vpc_id" {
  value = aws_vpc.main_vpc.id
  description = "The ID of the VPC"
}

# Output Subnet 1 ID
output "subnet_1_id" {
  value = aws_subnet.sub-1.id
  description = "The ID of Subnet 1"
}

# Output Subnet 2 ID
output "subnet_2_id" {
  value = aws_subnet.sub-2.id
  description = "The ID of Subnet 2"
}

# Output Internet Gateway ID
output "internet_gateway_id" {
  value = aws_internet_gateway.main-igw.id
  description = "The ID of the Internet Gateway"
}

# Output Route Table ID
output "route_table_id" {
  value = aws_route_table.main-rtb.id
  description = "The ID of the Route Table"
}

# Output the ALB DNS Name
output "alb_dns_name" {
  value = aws_alb.main-alb.dns_name
  description = "The DNS name of the Application Load Balancer"
}

# Output WebServer 1 Instance ID
output "webserver1_instance_id" {
  value = aws_instance.webserver1.id
  description = "The ID of Web Server 1 instance"
}

# Output WebServer 2 Instance ID
output "webserver2_instance_id" {
  value = aws_instance.webserver2.id
  description = "The ID of Web Server 2 instance"
}

# Output the S3 Bucket Name
output "s3_bucket_name" {
  value = aws_s3_bucket.main-s3.bucket
  description = "The name of the S3 bucket"
}

# Output the Security Group ID
output "security_group_id" {
  value = aws_security_group.main-sg.id
  description = "The ID of the Security Group"
}
