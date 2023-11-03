# Key Creation

# Key Creation for Private Windows Instances

resource "aws_key_pair" "impex-windows-key-pair-pri" {
key_name = "${var.windows-key-name-pri}"
public_key = tls_private_key.impex-windows-rsa-pri.public_key_openssh
}

resource "tls_private_key" "impex-windows-rsa-pri" {
algorithm = var.alg
rsa_bits  = var.bits
}

resource "local_file" "windows-impex-key-pri" {
content  = tls_private_key.impex-windows-rsa-pri.private_key_pem
filename = "${var.windows-keyfilename-pri}"
}


# Create EC2 Instance in Private subnet
resource "aws_instance" "Impex_windows_server_pri" {
  ami           = var.amitype-Windows
  instance_type = var.instancetype
  subnet_id                   = var.pri-subnet-id
  vpc_security_group_ids      = [var.pri_sg_id]
  associate_public_ip_address = false
  key_name      = aws_key_pair.impex-windows-key-pair-pri.key_name
  
  lifecycle {
    prevent_destroy = false
    ignore_changes = [instance_type, ami]
  }

  tags = {
    Name = var.pri_windows_instance_name  
  }
}

