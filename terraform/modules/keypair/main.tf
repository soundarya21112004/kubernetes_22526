# modules/keypair/main.tf

resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated" {
  key_name   = "k8s-jenkins-key"  # 👈 Changed from "k8s-key"
  public_key = tls_private_key.rsa.public_key_openssh
}

resource "local_file" "private_key" {
  content         = tls_private_key.rsa.private_key_pem
  filename        = "modules/keypair/k8s-jenkins-key.pem" # 👈 Updated filename too
  file_permission = "0400"
}