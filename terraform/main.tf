# main.tf (Root Directory)

module "vpc" {
  source = "./modules/vpc"
}

module "security_group" {
  source = "./modules/security_group"
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

  # 👈 This forces Terraform to create the key pair BEFORE the EC2 instances
  depends_on = [ module.keypair ]
}