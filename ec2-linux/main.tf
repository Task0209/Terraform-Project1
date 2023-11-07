# Key Creation

# Key Creation for Ubuntu Instances

resource "aws_key_pair" "impex-linux-key-pair" {
key_name = "${var.linux-key-name}"
public_key = tls_private_key.impex-linux-rsa.public_key_openssh
}

resource "tls_private_key" "impex-linux-rsa" {
algorithm = var.alg
rsa_bits  = var.bits
}

resource "local_file" "linux-impex-key" {
content  = tls_private_key.impex-linux-rsa.private_key_pem
filename = "${var.linux-keyfilename}"
}



# Create EC2 Instance in Private subnet
resource "aws_instance" "Impex_Linux_server" {
  ami           = var.amitype-Linux
  instance_type = var.instancetype
  subnet_id                   = var.pri-subnet-id
  vpc_security_group_ids      = [var.pri_sg_id]
  associate_public_ip_address = true
  key_name      = aws_key_pair.impex-linux-key-pair.key_name
  
  lifecycle {
    prevent_destroy = false
    ignore_changes = [instance_type, ami]
  }

  tags = {
    Name = var.linux_instance_name  
  }
}
