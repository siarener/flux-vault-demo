provider "aws" {
  region = var.region

  default_tags {
    tags = merge({
      source  = "Terraform Managed"
      cluster = var.cluster_name
    }, var.tags)
  }
}

module "vpc" {
  source               = "../modules/vpc"
  vpc_name             = var.cluster_name
  vpc_cidr             = var.vpc_cidr
  public_subnet_count  = var.public_subnet_count
  private_subnet_count = var.private_subnet_count
}

module "eks" {
  source       = "../modules/eks"
  cluster_name = var.cluster_name
  eks_version  = var.cluster_version
  vpc_id       = module.vpc.vpc_id
  subnet_ids   = concat(module.vpc.public_subnets, module.vpc.private_subnets)
}
