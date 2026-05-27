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

# Inventory generation for Ansible is done in Jenkins at runtime.
# Terraform should not reference any missing template files.


