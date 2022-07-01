// This part is to reach ec2 instances via SSH and test traffic behavior
// Create Internet Gateway
resource "aws_internet_gateway" "app-vpc-igw" {
  vpc_id = aws_vpc.app-vpc.id
  tags = {
    Name = "app-vpc-igw"
  }
}

# Default route for internet access
resource "aws_route" "app-to-internet" {
  route_table_id         = aws_route_table.app-rtb.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.app-vpc-igw.id
}

# Create Elastic IP for app-ec2-a
resource "aws_eip" "app-ec2-a-eip" {
  depends_on        = [aws_instance.app-ec2-a]
  vpc               = true
  network_interface = aws_network_interface.app-ec2-a-eth0.id
}

# Create Elastic IP for app-ec2-b
resource "aws_eip" "app-ec2-b-eip" {
  depends_on        = [aws_instance.app-ec2-b]
  vpc               = true
  network_interface = aws_network_interface.app-ec2-b-eth0.id
}

// This part is to reach ec2 instances via SSH and test traffic behavior
// Create Internet Gateway
resource "aws_internet_gateway" "db-vpc-igw" {
  vpc_id = aws_vpc.db-vpc.id
  tags = {
    Name = "db-vpc-igw"
  }
}

# Default route for internet access
resource "aws_route" "db-to-internet" {
  route_table_id         = aws_route_table.db-rtb.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.db-vpc-igw.id
}

# Create Elastic IP for db-ec2-b
resource "aws_eip" "db-ec2-a-eip" {
  depends_on        = [aws_instance.db-ec2-a]
  vpc               = true
  network_interface = aws_network_interface.db-ec2-a-eth0.id
}

# Create Elastic IP for db-ec2-b
resource "aws_eip" "db-ec2-b-eip" {
  depends_on        = [aws_instance.db-ec2-b]
  vpc               = true
  network_interface = aws_network_interface.db-ec2-b-eth0.id
}
