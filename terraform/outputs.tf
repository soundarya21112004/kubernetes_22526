output "master_public_ip" {
  value       = module.ec2.master_public_ip
  description = "Public IP of the Kubernetes Master Node"
}

output "worker1_public_ip" {
  value       = module.ec2.worker1_public_ip
  description = "Public IP of Kubernetes Worker Node 1"
}

output "worker2_public_ip" {
  value       = module.ec2.worker2_public_ip
  description = "Public IP of Kubernetes Worker Node 2"
}