resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated" {
  key_name   = "k8s-key"
  public_key = tls_private_key.rsa.public_key_openssh
}

resource "local_file" "private_key" {
  content  = tls_private_key.rsa.private_key_pem
  filename = "${path.module}/k8s-key.pem"

  provisioner "local-exec" {
    command = "chmod 400 ${path.module}/k8s-key.pem"
  }
}