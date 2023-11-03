# Key Creation


# Key Creation for Public Ubuntu Instances

resource "aws_key_pair" "impex-linux-key-pair-pub" {
key_name = "${var.linux-key-name-pub}"
public_key = tls_private_key.impex-linux-rsa-pub.public_key_openssh
}

resource "tls_private_key" "impex-linux-rsa-pub" {
algorithm = var.alg
rsa_bits  = var.bits
}

resource "local_file" "linux-impex-key-pub" {
content  = tls_private_key.impex-linux-rsa-pub.private_key_pem
filename = "${var.linux-keyfilename-pub}"
}


# Create EC2 Instance in Public subnet
resource "aws_instance" "Impex_Linux_server_pub" {
  ami           = var.amitype-Linux
  instance_type = var.instancetype
  subnet_id                   = var.pub-subnet-id
  vpc_security_group_ids      = [var.pub_sg_id]
  associate_public_ip_address = true
  key_name      = aws_key_pair.impex-linux-key-pair-pub.key_name
  
  lifecycle {
    prevent_destroy = false
    ignore_changes = [instance_type, ami]
  }

  tags = {
    Name = var.pub_linux_instance_name  
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = tls_private_key.impex-linux-rsa-pub.private_key_pem
    host        = self.public_ip
  }
  
  provisioner "file" {
    source      = "alpha-us-east-1-impex-book-private-linux-impexkeyfile-0-v1"
    destination = "/home/ubuntu/alpha-us-east-1-impex-book-private-linux-impexkeyfile-0-v1"
  }

   provisioner "file" {
    source      = "alpha-us-east-1-impex-book-private-linux-impexkeyfile-1-v1"
    destination = "/home/ubuntu/alpha-us-east-1-impex-book-private-linux-impexkeyfile-1-v1"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod 400 /home/ubuntu/alpha-us-east-1-impex-book-private-linux-impexkeyfile-0-v1",
      "chmod 400 /home/ubuntu/alpha-us-east-1-impex-book-private-linux-impexkeyfile-1-v1"
    ]
  }
}

# Elastic-IP (eip) 
resource "aws_eip" "eip_linux_impex_book" {
  domain   = var.domains
  instance = aws_instance.Impex_Linux_server_pub.id
}

# Elastic IP association
resource "aws_eip_association" "eip_assoc_impex_book" {
  instance_id   = aws_instance.Impex_Linux_server_pub.id
  allocation_id = aws_eip.eip_linux_impex_book.id
}