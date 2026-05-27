# main.tf

module "vpc" {
  source = "./modules/vpc"
}

module "security_group" {
  source = "./modules/security-group" # 👈 Option B path
  vpc_id = module.vpc.vpc_id
}

module "keypair" {
  source = "./modules/keypair"
}

module "ec2" {
  source    = "./modules/ec2"
  vpc_id    = module.vpc.vpc_id
  subnet_id = module.vpc.subnet_id
  sg_id     = module.security_group.sg_id

  # 👈 Prevents the "InvalidKeyPair.NotFound" error by making EC2 wait for Key Pair creation
  depends_on = [ module.keypair ]
}

# Automatically creates your inventory file for the Ansible stage
resource "local_file" "ansible_inventory" {
  content = templatefile("${path.module}/templates/inventory.tpl", {
    master_ip  = module.ec2.master_public_ip
    worker1_ip = module.ec2.worker1_public_ip
    worker2_ip = module.ec2.worker2_public_ip
  })
  filename = "../ansible/inventory.ini"
}