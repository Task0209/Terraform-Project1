output "windows-key-name-pub" {
  description = "Name of Key Pair for Public EC2 instance"
  value = aws_key_pair.impex-windows-key-pair-pub.key_name
}

output "windows-keyfilename-pub" {
  description = "Name of Key Pair file for Public EC2 Instance"
  value = local_file.windows-impex-key-pub.filename
}