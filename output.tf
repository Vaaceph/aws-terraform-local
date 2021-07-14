# Output variable definitions

output "vpc_public_subnets" {
  description = "IDs of the VPC's public subnets"
  value       = module.vpc.public_subnets
}

output "instance_id_1" {
  description = "ID of the first EC2 instance"
  value       = aws_instance.app_server_1.id
}

output "instance_public_ip_1" {
  description = "Public IP address of the first EC2 instance"
  value       = aws_instance.app_server_1.public_ip
}

output "instance_id_2" {
  description = "ID of the second EC2 instance"
  value       = aws_instance.app_server_2.id
}

output "instance_public_ip_2" {
  description = "Public IP address of the second EC2 instance"
  value       = aws_instance.app_server_2.public_ip
}
