output "linux-key-name-pri" {
  description = "Name of Key Pair for Private EC2 instance"
  value = aws_key_pair.impex-linux-key-pair-pri.key_name
}

output "linux-keyfilename-pri" {
  description = "Name of Key Pair file for Private EC2 Instance"
  value = local_file.linux-impex-key-pri.filename
}


