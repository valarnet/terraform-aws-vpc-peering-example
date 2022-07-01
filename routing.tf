# Create the App route table
resource "aws_route_table" "app-rtb" {
  vpc_id = aws_vpc.app-vpc.id

  tags = {
    Name = "app-rtb"
  }
}

# Associate app route table with app subnet a
resource "aws_route_table_association" "app-subnet-a" {
  subnet_id      = aws_subnet.app-subnet-a.id
  route_table_id = aws_route_table.app-rtb.id
}

# Associate app route table with app subnet b
resource "aws_route_table_association" "app-subnet-b" {
  subnet_id      = aws_subnet.app-subnet-b.id
  route_table_id = aws_route_table.app-rtb.id
}

# Create the DB route table
resource "aws_route_table" "db-rtb" {
  vpc_id = aws_vpc.db-vpc.id

  tags = {
    Name = "db-rtb"
  }
}

# Associate db route table with db subnet a
resource "aws_route_table_association" "db-subnet-a" {
  subnet_id      = aws_subnet.db-subnet-a.id
  route_table_id = aws_route_table.db-rtb.id
}

# Associate db route table with db subnet b
resource "aws_route_table_association" "db-subnet-b" {
  subnet_id      = aws_subnet.db-subnet-b.id
  route_table_id = aws_route_table.db-rtb.id
}

