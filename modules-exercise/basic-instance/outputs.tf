output "web_instance_public_ip" {
    value = aws_instance.web.public_ip
}

# output "instance_public_ip" {
#   value = aws_instance.ec2-instance.public_ip
# }
