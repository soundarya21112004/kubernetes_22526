# modules/ec2/main.tf

resource "aws_instance" "master" {
  ami                    = "ami-0522ab6e1ddcc7055"
  instance_type          = "t2.medium"
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.sg_id]
  key_name               = "k8s-jenkins-key"

  tags = {
    Name = "k8s-master"
  }
}

resource "aws_instance" "worker1" {
  ami                    = "ami-0522ab6e1ddcc7055"
  instance_type          = "t2.micro"
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.sg_id]
  key_name               = "k8s-jenkins-key"

  tags = {
    Name = "k8s-worker-1"
  }
}

resource "aws_instance" "worker2" {
  ami                    = "ami-0522ab6e1ddcc7055"
  instance_type          = "t2.micro"
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.sg_id]
  key_name               = "k8s-jenkins-key"

  tags = {
    Name = "k8s-worker-2"
  }
}