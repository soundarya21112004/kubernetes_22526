module "vpc" {
  source = "./modules/vpc"
}

module "security_group" {
  source = "./modules/security-group"
  vpc_id = module.vpc.vpc_id
}

module "keypair" {
  source = "./modules/keypair"
}

module "ec2" {
  source = "./modules/ec2"

  subnet_id         = module.vpc.public_subnet_id
  security_group_id = module.security_group.sg_id
  key_name          = module.keypair.key_name
}

# --- AUTOMATIC INVENTORY GENERATION ---
# This block creates your inventory.ini file for Ansible automatically
resource "local_file" "ansible_inventory" {
  content = <<EOT
[master]
${module.ec2.master_public_ip} ansible_user=ubuntu

[workers]
${module.ec2.worker1_public_ip} ansible_user=ubuntu
${module.ec2.worker2_public_ip} ansible_user=ubuntu
EOT

  filename = "../ansible/inventory.ini"
}