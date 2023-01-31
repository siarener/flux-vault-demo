provider "aws" {
  region = var.region

  default_tags {
    tags = merge({
      source  = "Terraform Managed"
      cluster = var.cluster_name
    }, var.tags)
  }
}

data "aws_eks_cluster" "this" {
  name = var.cluster_name
}

data "aws_eks_cluster_auth" "this" {
  name = var.cluster_name
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.this.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.this.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.this.token
}

module "node_group" {
  source                    = "../modules/node-group"
  cluster_name              = var.cluster_name
  node_group_name           = "${var.cluster_name}-ng"
  vpc_id                    = data.aws_eks_cluster.this.vpc_config.vpc_id
  subnet_ids                = var.subnet_ids
  cluster_security_group_id = data.aws_eks_cluster.this.vpc_config.cluster_security_group_id
  desired_size              = var.desired_size
  min_size                  = var.min_size
  max_size                  = var.max_size
  capacity_type             = var.capacity_type
  resource_tags             = var.tags
}

data "aws_caller_identity" "current" {}

module "aws_auth" {
  source              = "../modules/aws-auth"
  accounts            = [data.aws_caller_identity.current.account_id]
  cluster_admin_roles = var.cluster_admin_roles
  cluster_admin_users = var.cluster_admin_users
  node_group_role_arns = [
    module.node_group.node_group_role.arn,
  ]
}
