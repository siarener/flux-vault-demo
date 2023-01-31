variable "region" {
  type        = string
  description = "AWS region for cluster"
  default     = "us-east-1"
}

variable "cluster_name" {
  type        = string
  description = "EKS cluster name"
}

variable "subnet_ids" {
  type        = list(string)
  description = "subnets to associate with node group"
}

variable "tags" {
  type        = map(string)
  description = "resource specific tags"
  default     = null
}

variable "desired_size" {
  type        = number
  description = "Desired number of instances in Node Group"
  default     = 2
}

variable "max_size" {
  type        = number
  description = "Max number of instances in Node Group"
  default     = 3
}

variable "min_size" {
  type        = number
  description = "Min number of instances in Node Group"
  default     = 1
}

variable "capacity_type" {
  type        = string
  description = "Capacity associated with Node Group (SPOT or ON_DEMAND)"
  default     = null
}

variable "instance_type" {
  type        = string
  description = "Instance type associated with Node Group"
  default     = "t3.medium"
}

variable "cluster_admin_users" {
  type        = list(string)
  description = "list of IAM users to be granted admin access in eks aws_auth configmap"
  default     = []
}

variable "cluster_admin_roles" {
  type        = list(string)
  description = "list of IAM roles to be granted admin access in eks aws_auth configmap"
  default     = []
}
