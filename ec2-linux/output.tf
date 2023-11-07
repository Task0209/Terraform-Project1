output "linux-key-name" {
  description = "Name of Key Pair"
  value = aws_key_pair.impex-linux-key-pair.key_name
}

output "linux-keyfilename" {
  description = "Name of Key Pair file"
  value = local_file.linux-impex-key.filename
}

