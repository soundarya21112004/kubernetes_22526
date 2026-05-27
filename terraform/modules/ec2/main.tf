# modules/ec2/main.tf

resource "aws_instance" "master" {
  ami           = "ami-0522ab6e1ddcc7055"
  instance_type = "t2.medium"
  key_name      = "k8s-jenkins-key"  # 👈 Changed here

  tags = {
    Name = "k8s-master"
  }
}

resource "aws_instance" "worker1" {
  ami           = "ami-0522ab6e1ddcc7055"
  instance_type = "t2.micro"
  key_name      = "k8s-jenkins-key"  # 👈 Changed here

  tags = {
    Name = "k8s-worker-1"
  }
}

resource "aws_instance" "worker2" {
  ami           = "ami-0522ab6e1ddcc7055"
  instance_type = "t2.micro"
  key_name      = "k8s-jenkins-key"  # 👈 Changed here

  tags = {
    Name = "k8s-worker-2"
  }
}