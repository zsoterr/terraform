output "security_group_id" {
  value = aws_security_group.allow_tls_ssh.id
}

output "security_group_name" {
  value = aws_security_group.allow_tls_ssh.name
}
