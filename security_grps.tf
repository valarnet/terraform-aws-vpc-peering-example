# Create security group a and add rule
resource "aws_security_group" "app-sg-a" {
  name        = var.app_sg_name[0]
  description = var.app_sg_name[0]
  vpc_id      = aws_vpc.app-vpc.id

  ingress {
    description = "allow-traffic-from-db-subnet-a"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.db_subnet_cidr[0]]
  }

  ingress {
    description = "allow-me-to-ssh"
    from_port   = 0
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.your_public_ip]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.app_sg_name[0]
  }
}

# Create security group b and add rule
resource "aws_security_group" "app-sg-b" {
  name        = var.app_sg_name[1]
  description = var.app_sg_name[1]
  vpc_id      = aws_vpc.app-vpc.id

  ingress {
    description = "allow-traffic-from-db-subnet-b"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.db_subnet_cidr[1]]
  }

  ingress {
    description = "allow-me-to-ssh"
    from_port   = 0
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.your_public_ip]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.app_sg_name[1]
  }
}

# Create security group a and add rule
resource "aws_security_group" "db-sg-a" {
  name        = var.db_sg_name[0]
  description = var.db_sg_name[0]
  vpc_id      = aws_vpc.db-vpc.id

  ingress {
    description = "allow-traffic-from-app-subnet-a"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.app_subnet_cidr[0]]
  }

  ingress {
    description = "allow-me-to-ssh"
    from_port   = 0
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.your_public_ip]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.db_sg_name[0]
  }
}

# Create security group b and add rule
resource "aws_security_group" "db-sg-b" {
  name        = var.db_sg_name[1]
  description = var.db_sg_name[1]
  vpc_id      = aws_vpc.db-vpc.id

  ingress {
    description = "allow-traffic-from-app-subnet-b"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.app_subnet_cidr[1]]
  }

  ingress {
    description = "allow-me-to-ssh"
    from_port   = 0
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.your_public_ip]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.db_sg_name[1]
  }
}
