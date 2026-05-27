# modules/keypair/main.tf

resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated" {
  key_name   = "k8s-jenkins-key"
  public_key = tls_private_key.rsa.public_key_openssh

  # Avoid failing Jenkins on subsequent runs if keypair already exists
  lifecycle {
    ignore_changes = [public_key]
  }
}


resource "local_file" "private_key" {
  content         = tls_private_key.rsa.private_key_pem
  filename        = "modules/keypair/k8s-jenkins-key.pem"
  file_permission = "0400"
}