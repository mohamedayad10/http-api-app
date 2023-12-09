# NAT Gateway to allow private subnet to connect out the way
resource "aws_nat_gateway" "nat-gateway-for-private-subnet" {
  connectivity_type = "private"
  subnet_id         = aws_subnet.private-subnet.id
}