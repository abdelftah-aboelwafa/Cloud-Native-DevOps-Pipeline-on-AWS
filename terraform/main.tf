module "vpc" {
  source = "./vpc"
}


module "ec2_public" {
  source    = "./ec2"
  vpc_id    = module.vpc.vpc_id
  subnet_id = module.vpc.public_subnet_id
  key_name = var.key_name
  is_private = false
}

# module "ec2_private" {
#   source    = "./ec2"
#   vpc_id    =  module.vpc.vpc_id
#   subnet_id = module.vpc.private_subnet_id
#   key_name = var.key_name
#   is_private = true
# }

module "eks" {
  source = "./eks"

  cluster_name = "my-eks-cluster"

  vpc_id          = module.vpc.vpc_id
  private_subnets = module.vpc.private_subnets
  public_subnets  = module.vpc.public_subnets
}