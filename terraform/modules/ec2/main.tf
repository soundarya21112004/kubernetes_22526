# 1. Kubernetes Master Node
resource "aws_instance" "master" {
  ami                    = "ami-0522ab6e1ddcc7055" # Updated Ubuntu 22.04 LTS AMI
  instance_type          = "t2.medium"             
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]
  key_name               = var.key_name

  tags = {
    Name = "k8s-master"
  }
}

# 2. Kubernetes Worker Node 1
resource "aws_instance" "worker1" {
  ami                    = "ami-0522ab6e1ddcc7055" # Updated Ubuntu 22.04 LTS AMI
  instance_type          = "t2.micro"
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]
  key_name               = var.key_name

  tags = {
    Name = "k8s-worker-1"
  }
}

# 3. Kubernetes Worker Node 2
resource "aws_instance" "worker2" {
  ami                    = "ami-0522ab6e1ddcc7055" # Updated Ubuntu 22.04 LTS AMI
  instance_type          = "t2.micro"
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]
  key_name               = var.key_name

  tags = {
    Name = "k8s-worker-2"
  }
}