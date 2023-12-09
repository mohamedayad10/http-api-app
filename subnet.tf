resource "aws_subnet" "public-subnet" {
  vpc_id                  = aws_vpc.dev-vpc.id
  cidr_block              = var.public-subnet
  availability_zone       = "${var.region}a"
  map_public_ip_on_launch = true
}
resource "aws_subnet" "private-subnet" {
  vpc_id            = aws_vpc.dev-vpc.id
  cidr_block        = var.private-subnet
  availability_zone = "${var.region}b"
}