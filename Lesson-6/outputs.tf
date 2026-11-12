output "webserver_instance_id" {
  value = aws_instance.my_web_server.id
}


output "webserver_public_ip" {
  value = aws_instance.my_web_server.public_ip
}

output "webserver_sg_id" {
  value = aws_security_group.my_web_server.id
}

output "webserver_arn" {
  value       = aws_security_group.my_web_server.arn
  description = "This is security group"
}
