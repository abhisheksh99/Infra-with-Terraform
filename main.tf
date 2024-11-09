# Create VPC
resource "aws_vpc" "main_vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = var.vpc_name
  }
}

# Create Subnet 1
resource "aws_subnet" "sub-1" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = var.subnet_1_cidr_block
  availability_zone       = var.subnet_1_az
  map_public_ip_on_launch = true
  
  tags = {
    Name = var.subnet_1_name
  }
}

# Create Subnet 2
resource "aws_subnet" "sub-2" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = var.subnet_2_cidr_block
  availability_zone       = var.subnet_2_az
  map_public_ip_on_launch = true
  
  tags = {
    Name = var.subnet_2_name
  }
}

# Create Internet Gateway
resource "aws_internet_gateway" "main-igw" {
  vpc_id = aws_vpc.main_vpc.id
  
  tags = {
    Name = var.igw_name
  }
}

# Create Route Table
resource "aws_route_table" "main-rtb" {
  vpc_id = aws_vpc.main_vpc.id
  
  route {
    gateway_id = aws_internet_gateway.main-igw.id
    cidr_block = "0.0.0.0/0"
  }
  
  tags = {
    Name = var.route_table_name
  }
}

# Associate Route Table with Subnet 1
resource "aws_route_table_association" "main-rtb-association-1" {
  subnet_id      = aws_subnet.sub-1.id
  route_table_id = aws_route_table.main-rtb.id
}

# Associate Route Table with Subnet 2
resource "aws_route_table_association" "main-rtb-association-2" {
  subnet_id      = aws_subnet.sub-2.id
  route_table_id = aws_route_table.main-rtb.id
}

# Create Security Group for Web Servers
resource "aws_security_group" "main-sg" {
  name   = var.sg_name
  vpc_id = aws_vpc.main_vpc.id

  ingress {
    description = "HTTP from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.sg_name
  }
}

# Create S3 Bucket
resource "aws_s3_bucket" "main-s3" {
  bucket = var.s3_bucket_name
  
  tags = {
    Name = "Main-S3-Bucket"
  }
}

# Launch Web Server 1 in Subnet 1
resource "aws_instance" "webserver1" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.main-sg.id]
  subnet_id              = aws_subnet.sub-1.id
  user_data              = base64encode(file("userdata.sh"))

  tags = {
    Name = var.webserver_1_name
  }
}

# Launch Web Server 2 in Subnet 2
resource "aws_instance" "webserver2" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.main-sg.id]
  subnet_id              = aws_subnet.sub-2.id
  user_data              = base64encode(file("userdata1.sh"))

  tags = {
    Name = var.webserver_2_name
  }
}

# Create Application Load Balancer (ALB)
resource "aws_alb" "main-alb" {
  name               = var.alb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.main-sg.id]
  subnets            = [aws_subnet.sub-1.id, aws_subnet.sub-2.id]

  tags = {
    Name = var.alb_name
  }
}

# Create Target Group for ALB
resource "aws_alb_target_group" "main-alb-target" {
  name     = var.alb_target_group_name
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main_vpc.id
  
  health_check {
    path = "/"
    port = "traffic-port"
  }

  tags = {
    Name = var.alb_target_group_name
  }
}

# Attach WebServer 1 to Target Group
resource "aws_alb_target_group_attachment" "attach1" {
  target_group_arn = aws_alb_target_group.main-alb-target.arn
  target_id        = aws_instance.webserver1.id
  port             = 80
}

# Attach WebServer 2 to Target Group
resource "aws_alb_target_group_attachment" "attach2" {
  target_group_arn = aws_alb_target_group.main-alb-target.arn
  target_id        = aws_instance.webserver2.id
  port             = 80
}

# Create ALB Listener to Forward Traffic to Target Group
resource "aws_lb_listener" "main-alb-aws_lb_listener" {
  load_balancer_arn = aws_alb.main-alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_alb_target_group.main-alb-target.arn
    type             = "forward"
  }

  tags = {
    Name = var.alb_listener_name
  }
}
