# modules/ec2/outputs.tf

output "master_public_ip" {
  value = aws_instance.master.public_ip
}What's New

Free Unlimited Agent Requests


output "worker1_public_ip" {
  value = aws_instance.worker1.public_ip
}

output "worker2_public_ip" {
  value = aws_instance.worker2.public_ip
}