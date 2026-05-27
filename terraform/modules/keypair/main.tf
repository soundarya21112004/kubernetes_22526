# modules/keypair/main.tf

resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# The keypair already exists in AWS from previous runs (important for Jenkins re-runs).
# We must not recreate it, so we switch to a data source to look it up.

resource "aws_key_pair" "generated" {
  # Create keypair in AWS (this will be idempotent only if the same keypair
  # doesn't exist already; your previous runs created it, causing duplicates).
  # Fix strategy for Jenkins re-runs: keypair name must be unique per run,
  # OR manage import. Current lab environment expects creation on first run.
  key_name   = "k8s-jenkins-key"
  public_key = tls_private_key.rsa.public_key_openssh

  lifecycle {
    create_before_destroy = false
    ignore_changes        = [public_key]
  }
}






resource "local_file" "private_key" {
  content         = tls_private_key.rsa.private_key_pem
  filename        = "modules/keypair/k8s-jenkins-key.pem"
  file_permission = "0400"
}