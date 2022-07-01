# We are initiating the VPC peering request from the App VPC
resource "aws_vpc_peering_connection" "app-to-db-peering" {
  peer_owner_id = var.db_vpc_owner_id
  peer_vpc_id   = aws_vpc.db-vpc.id
  vpc_id        = aws_vpc.app-vpc.id

}

# Add a route for traffic from app to db vpc over the peering
# Route for app-subnet-a to db-subnet-a
resource "aws_route" "app-a-to-db-a-route" {
  route_table_id            = aws_route_table.app-rtb.id
  destination_cidr_block    = var.db_subnet_cidr[0]
  vpc_peering_connection_id = aws_vpc_peering_connection.app-to-db-peering.id
  depends_on                = [aws_route_table.app-rtb]
}

# Add a route for traffic from app to db vpc over the peering
# Route for app-subnet-b to db-subnet-b
resource "aws_route" "app-b-to-db-b-route" {
  route_table_id            = aws_route_table.app-rtb.id
  destination_cidr_block    = var.db_subnet_cidr[1]
  vpc_peering_connection_id = aws_vpc_peering_connection.app-to-db-peering.id
  depends_on                = [aws_route_table.app-rtb]
}

# Add a route for traffic from db to app vpc over the peering
# Route for db-subnet-a to app-subnet-a
resource "aws_route" "db-a-to-app-a-route" {
  route_table_id            = aws_route_table.db-rtb.id
  destination_cidr_block    = var.app_subnet_cidr[0]
  vpc_peering_connection_id = aws_vpc_peering_connection.app-to-db-peering.id
  depends_on                = [aws_route_table.db-rtb]
}

# Add a route for traffic from db to PP vpc over the peering
# Route for DB-subnet-b to app-subnet-b
resource "aws_route" "db-b-to-app-b-route" {
  route_table_id            = aws_route_table.db-rtb.id
  destination_cidr_block    = var.app_subnet_cidr[1]
  vpc_peering_connection_id = aws_vpc_peering_connection.app-to-db-peering.id
  depends_on                = [aws_route_table.db-rtb]
}
