output "cloudwatch_log_group_name1" {
  description = "Log Group name for Booking Request"
  value       = aws_cloudwatch_log_group.impex-booking-request-logs1.name
}

output "cloudwatch_log_group_name2" {
  description = "Log Group name for Booking Request"
  value       = aws_cloudwatch_log_group.impex-booking-request-logs2.name
}


