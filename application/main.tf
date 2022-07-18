resource "aws_instance" "tfe-ami-web" {
  ami           = var.ami
  instance_type = var.ec2_instance_type
  tags = var.tags
}