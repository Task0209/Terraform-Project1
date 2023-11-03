output "windows-key-name-pri" {
  description = "Name of Key Pair for Private EC2 instance"
  value = aws_key_pair.impex-windows-key-pair-pri.key_name
}

output "windows-keyfilename-pri" {
  description = "Name of Key Pair file for Private EC2 Instance"
  value = local_file.windows-impex-key-pri.filename
}