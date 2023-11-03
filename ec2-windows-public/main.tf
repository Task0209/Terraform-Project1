# Key Creation


# Key Creation for Public Ubuntu Instances

resource "aws_key_pair" "impex-windows-key-pair-pub" {
key_name = "${var.windows-key-name-pub}"
public_key = tls_private_key.impex-windows-rsa-pub.public_key_openssh
}

resource "tls_private_key" "impex-windows-rsa-pub" {
algorithm = var.alg
rsa_bits  = var.bits
}

resource "local_file" "windows-impex-key-pub" {
content  = tls_private_key.impex-windows-rsa-pub.private_key_pem
filename = "${var.windows-keyfilename-pub}"
}


# Create EC2 Instance in Private subnet
resource "aws_instance" "Impex_Windows_server_pub" {
  ami           = var.amitype-Windows
  instance_type = var.instancetype
  subnet_id                   = var.pub-subnet-id
  vpc_security_group_ids      = [var.pub_sg_id]
  associate_public_ip_address = true
  key_name      = aws_key_pair.impex-windows-key-pair-pub.key_name

  lifecycle {
    prevent_destroy = false
    ignore_changes = [instance_type, ami]
  }

  tags = {
    Name = var.pub_windows_instance_name
}
}

# Elastic-IP (eip) 
resource "aws_eip" "eip_windows_impex_book" {
  domain   = var.domains
  instance = aws_instance.Impex_Windows_server_pub.id
}

# Elastic IP association
resource "aws_eip_association" "eip_assoc_impex_book" {
  instance_id   = aws_instance.Impex_Windows_server_pub.id
  allocation_id = aws_eip.eip_windows_impex_book.id
}