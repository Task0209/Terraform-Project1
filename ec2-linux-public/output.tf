
output "linux-key-name-pub" {
  description = "Name of Key Pair for Public EC2 instance"
  value = aws_key_pair.impex-linux-key-pair-pub.key_name
}

output "linux-keyfilename-pub" {
  description = "Name of Key Pair file for Public EC2 Instance"
  value = local_file.linux-impex-key-pub.filename
}

output "Public_IP" {
  description = "Public IP for Public EC2 Linux Instance"
  value = aws_instance.Impex_Linux_server_pub.public_ip
}



