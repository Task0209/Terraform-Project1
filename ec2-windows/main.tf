# Create EC2 Instance in Private subnet
resource "aws_instance" "Impex_Windows_server" {
  ami           = var.amitype-Windows
  instance_type = var.instancetype
  subnet_id                   = var.pri-subnet-id
  vpc_security_group_ids      = [var.pri_sg_id]
  associate_public_ip_address = false

  lifecycle {
    prevent_destroy = false
    ignore_changes = [instance_type, ami]
  }

  tags = {
    Name = var.windows_instance_name
}
}