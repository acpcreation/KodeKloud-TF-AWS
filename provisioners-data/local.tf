# Creates a local resource (on the client running apply)

resource "null_resource" "local_null_resource" {

  provisioner "local-exec" {
    command = "echo 'Provisioning successful' > provisioner.txt"
  }

}