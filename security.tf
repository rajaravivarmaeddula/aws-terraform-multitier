# 1. Security Group for Application Load Balancer (Public access)
resource "aws_security_group" "alb_sg" {
  name        = "multitier-alb-sg"
  description = "Allow HTTP inbound traffic to ALB"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "Allow HTTP from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "multitier-alb-sg"
  }
}

# 2. Security Group for Web Servers (Private access ONLY from ALB)
resource "aws_security_group" "web_sg" {
  name        = "multitier-web-sg"
  description = "Allow HTTP traffic ONLY from ALB Security Group"
  vpc_id      = aws_vpc.main.id

  ingress {
    description     = "Allow HTTP traffic from ALB SG"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.alb_sg.id]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "multitier-web-sg"
  }
}
