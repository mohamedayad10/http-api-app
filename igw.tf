resource "aws_internet_gateway" "internet-gateway" {
  vpc_id = aws_vpc.dev-vpc.id
}