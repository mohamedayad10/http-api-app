resource "tls_private_key" "itida-key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
output "private-key" {
  value = tls_private_key.itida-key.private_key_pem
}
resource "aws_key_pair" "generated_key" {
  key_name   = "iti"
  public_key = tls_private_key.itida-key.public_key_openssh
}