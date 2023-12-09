resource "aws_route_table" "public-routing-table" {
  vpc_id = aws_vpc.dev-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet-gateway.id
  }
}
resource "aws_route_table_association" "rt_associate_public-1" {
  subnet_id      = aws_subnet.public-subnet.id
  route_table_id = aws_route_table.public-routing-table.id
}
########################################
resource "aws_route_table" "private-route" {
  vpc_id = aws_vpc.dev-vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-gateway-for-private-subnet.id
  }
}
resource "aws_route_table_association" "rw-private1" {
  subnet_id      = aws_subnet.private-subnet.id
  route_table_id = aws_route_table.private-route.id
}