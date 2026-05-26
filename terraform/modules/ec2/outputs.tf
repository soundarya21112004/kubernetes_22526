output "master_public_ip" {
  value       = aws_instance.master.public_ip
  description = "Public IP of the K8s Master Node"
}

output "worker1_public_ip" {
  value       = aws_instance.worker1.public_ip
  description = "Public IP of K8s Worker Node 1"
}

output "worker2_public_ip" {
  value       = aws_instance.worker2.public_ip
  description = "Public IP of K8s Worker Node 2"
}