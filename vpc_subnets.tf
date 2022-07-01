// This section of code provisions the Application VPC
// env_prefix=app, az=us-east-1c, vpc_cidr=172.23.0.0/16
// subnet-a is 172.23.0.0/24, subnet-b is 172.23.1.0/24
# Create app VPC
resource "aws_vpc" "app-vpc" {
  cidr_block = var.app_vpc_cidr
  tags = {
    Name = format("%s-%s", var.env_prefix[0], "vpc")
  }
}

# Create app-subnet-a
resource "aws_subnet" "app-subnet-a" {
  vpc_id            = aws_vpc.app-vpc.id
  cidr_block        = var.app_subnet_cidr[0]
  availability_zone = var.app_az
  tags = {
    Name = format("%s-%s", var.env_prefix[0], var.app_subnet_name[0])
  }
}

# Create app-subnet-b
resource "aws_subnet" "app-subnet-b" {
  vpc_id            = aws_vpc.app-vpc.id
  cidr_block        = var.app_subnet_cidr[1]
  availability_zone = var.app_az
  tags = {
    Name = format("%s-%s", var.env_prefix[1], var.app_subnet_name[1])
  }
}

// This section of code is for the Database VPC
// env_prefix=app, az=us-east-1d, vpc_cidr=172.24.0.0/16
// subnet-a is 172.24.0.0/24, subnet-b is 172.24.1.0/24
# Create db VPC
resource "aws_vpc" "db-vpc" {
  cidr_block = var.db_vpc_cidr
  tags = {
    Name = format("%s-%s", var.env_prefix[1], "vpc")
  }
}

# Create db-subnet-a
resource "aws_subnet" "db-subnet-a" {
  vpc_id            = aws_vpc.db-vpc.id
  cidr_block        = var.db_subnet_cidr[0]
  availability_zone = var.db_az
  tags = {
    Name = format("%s-%s", var.env_prefix[1], var.db_subnet_name[0])
  }
}

# Create db-subnet-b
resource "aws_subnet" "db-subnet-b" {
  vpc_id            = aws_vpc.db-vpc.id
  cidr_block        = var.db_subnet_cidr[1]
  availability_zone = var.db_az
  tags = {
    Name = format("%s-%s", var.env_prefix[1], var.db_subnet_name[1])
  }
}
