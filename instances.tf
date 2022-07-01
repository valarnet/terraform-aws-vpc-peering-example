# Create network interface for app ec2 in subnet a
resource "aws_network_interface" "app-ec2-a-eth0" {
  description     = format("%s-%s", var.app_ec2_name[0], "-intf")
  subnet_id       = aws_subnet.app-subnet-a.id
  private_ips     = [var.app_ec2_ip[0]]
  security_groups = [aws_security_group.app-sg-a.id]
}

# Create network interface for app ec2 in subnet b
resource "aws_network_interface" "app-ec2-b-eth0" {
  description     = format("%s-%s", var.app_ec2_name[1], "-intf")
  subnet_id       = aws_subnet.app-subnet-b.id
  private_ips     = [var.app_ec2_ip[1]]
  security_groups = [aws_security_group.app-sg-b.id]
}

# Create app ec2 instance in subnet a
resource "aws_instance" "app-ec2-a" {
  instance_type = "t2.micro"
  ami           = "ami-0022f774911c1d690" # Just using the default Amazon Linux AMI
  key_name      = "my_ec2_key"

  # Attaching the network interface with the ec2 instance 
  network_interface {
    network_interface_id = aws_network_interface.app-ec2-a-eth0.id
    device_index         = 0
  }

  depends_on = [
    aws_network_interface.app-ec2-a-eth0
  ]

  tags = {
    Name = var.app_ec2_name[0]
  }
}

# Create app ec2 instance in subnet b
resource "aws_instance" "app-ec2-b" {
  instance_type = "t2.micro"
  ami           = "ami-0022f774911c1d690" # Just using the default Amazon Linux AMI
  key_name      = "my_ec2_key"

  # Attaching the network interface with the ec2 instance 
  network_interface {
    network_interface_id = aws_network_interface.app-ec2-b-eth0.id
    device_index         = 0
  }

  depends_on = [
    aws_network_interface.app-ec2-b-eth0
  ]

  tags = {
    Name = var.app_ec2_name[1]
  }
}

# Create network interface for db ec2 in subnet a
resource "aws_network_interface" "db-ec2-a-eth0" {
  description     = format("%s-%s", var.db_ec2_name[0], "-intf")
  subnet_id       = aws_subnet.db-subnet-a.id
  private_ips     = [var.db_ec2_ip[0]]
  security_groups = [aws_security_group.db-sg-a.id]
}

# Create network interface for db ec2 in subnet b
resource "aws_network_interface" "db-ec2-b-eth0" {
  description     = format("%s-%s", var.db_ec2_name[1], "-intf")
  subnet_id       = aws_subnet.db-subnet-b.id
  private_ips     = [var.db_ec2_ip[1]]
  security_groups = [aws_security_group.db-sg-b.id]
}

# Create db ec2 instance in subnet a
resource "aws_instance" "db-ec2-a" {
  instance_type = "t2.micro"
  ami           = "ami-0022f774911c1d690" # Just using the default Amazon Linux AMI
  key_name      = "my_ec2_key"

  # Attaching the network interface with the ec2 instance 
  network_interface {
    network_interface_id = aws_network_interface.db-ec2-a-eth0.id
    device_index         = 0
  }

  depends_on = [
    aws_network_interface.db-ec2-a-eth0
  ]

  tags = {
    Name = var.db_ec2_name[0]
  }
}

# Create db ec2 instance in subnet b
resource "aws_instance" "db-ec2-b" {
  instance_type = "t2.micro"
  ami           = "ami-0022f774911c1d690" # Just using the default Amazon Linux AMI
  key_name      = "my_ec2_key"

  # Attaching the network interface with the ec2 instance 
  network_interface {
    network_interface_id = aws_network_interface.db-ec2-b-eth0.id
    device_index         = 0
  }

  depends_on = [
    aws_network_interface.db-ec2-b-eth0
  ]

  tags = {
    Name = var.db_ec2_name[1]
  }
}
