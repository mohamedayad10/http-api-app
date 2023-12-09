# Creating EC2 instance in Public Subnet
resource "aws_instance" "python-app" {
  ami                         = var.image
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.generated_key.key_name
  vpc_security_group_ids      = [aws_security_group.security-group.id]
  subnet_id                   = aws_subnet.public-subnet.id
  associate_public_ip_address = true
  user_data                   = <<-EOF
  #!/bin/bash
  sudo yum update -y
        sudo yum upgrade -y
        sudo yum install docker -y
        sudo systemctl start docker
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version
sudo usermod -aG docker ec2-user
        EOF
}
resource "aws_launch_configuration" "as_conf" {
  name          = "web_config"
  image_id      = aws_instance.python-app.ami
  instance_type = "t2.micro"
}
resource "aws_autoscaling_group" "auto-scale" {
  desired_capacity = 2 # Specify the desired number of instances
  max_size         = 3 # Specify the maximum number of instances
  min_size         = 1 # Specify the minimum number of instances

  vpc_zone_identifier       = [aws_subnet.public-subnet.id, aws_subnet.public-subnet-2.id] # Specify your VPC subnet(s)
  launch_configuration      = aws_launch_configuration.as_conf.name
  health_check_type         = "EC2" # Set the health check type
  health_check_grace_period = 300   # Set the health check grace period (in seconds)
}
resource "aws_db_instance" "database" {
  identifier           = "rds-database"
  allocated_storage    = 10
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  username             = var.db-user
  password             = var.db-pass
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  multi_az             = true # Enable Multi-AZ deployment
  publicly_accessible  = false
}
