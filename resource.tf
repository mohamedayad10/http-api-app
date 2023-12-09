# Creating EC2 instance in Public Subnet
resource "aws_instance" "python-app" {
  ami                         = var.image
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.generated_key.key_name
  vpc_security_group_ids      = [aws_security_group.security-group.id]
  subnet_id                   = aws_subnet.public-subnet.id
  associate_public_ip_address = true
}

resource "aws_db_instance" "database" {
  allocated_storage    = 10
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  username             = var.db-user
  password             = var.db-pass
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  db_subnet_group_name = var.private-subnet.id
}