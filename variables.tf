// Region variables
variable "aws_region" {
  description = "AWS region"
  type        = string
}

// VPC Environment
variable "env_prefix" {
  description = "VPC environment description"
  type        = list(string)
}

// Declare public IP you'll connect from via SSH
variable "your_public_ip" {
  description = "Public IP you will SSH from"
  type        = string
}

// VPC CIDR variables
variable "app_vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
}

variable "db_vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
}

// Availability zone variables
variable "app_az" {
  description = "Availability Zone"
  type        = string
}

variable "db_az" {
  description = "Availability Zone"
  type        = string
}

// Subnet name variables
variable "app_subnet_name" {
  description = "app subnet names"
  type        = list(string)
}

variable "db_subnet_name" {
  description = "db subnet names"
  type        = list(string)
}

// Subnet CIDR variables
variable "app_subnet_cidr" {
  description = "App Subnet CIDR block"
  type        = list(string)
}

variable "db_subnet_cidr" {
  description = "DB Subnet CIDR block"
  type        = list(string)
}

// Security group variables
variable "app_sg_name" {
  description = "APP Security Groups"
  type        = list(string)
}

variable "db_sg_name" {
  description = "DB Security Groups"
  type        = list(string)
}

// EC2 instance name variables
variable "app_ec2_name" {
  description = "App EC2 instance names"
  type        = list(string)
}

variable "db_ec2_name" {
  description = "DB EC2 instance names"
  type        = list(string)
}


// EC2 instance IPs
variable "app_ec2_ip" {
  description = "IP assign on App EC2 instances"
  type        = list(string)
}

variable "db_ec2_ip" {
  description = "IP assign on DB EC2 instances"
  type        = list(string)
}

// Declare VPC Peering Variables

variable "app_vpc_owner_id" {
  description = "Account ID where App VPC resides "
  type        = string
}

variable "db_vpc_owner_id" {
  description = "Account ID where DB VPC resides "
  type        = string
}
