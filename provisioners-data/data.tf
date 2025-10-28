data "aws_instance" "new_instance" {
  instance_id = "i-032171705cc129cd1" # From AWS
}

output "nontf_instance_ip" {
  value = data.aws_instance.new_instance.public_ip
}