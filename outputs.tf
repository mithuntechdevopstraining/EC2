output "instance_id" {
  value = aws_instance.main[*].id
  description = "Ec2 instance id"
}

output "public_ips" {
  value = aws_instance.main[*].public_ip
  description = "Ec2 instance public ips"
}

output "security_group_id" {
  value = aws_security_group.main.id 
  description = "Id of the SG"
}