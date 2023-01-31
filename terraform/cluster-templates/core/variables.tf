variable "region" {
  type        = string
  description = "AWS region for cluster"
  default     = "us-east-1"
}

variable "cluster_name" {
  type        = string
  description = "EKS cluster name"
}

variable "cluster_version" {
  type        = string
  description = "EKS cluster version"
  default     = "1.24"
}

variable "vpc_cidr" {
  type        = string
  description = "cidr range for vpc"
  default     = "10.0.0.0/16"
}

variable "tags" {
  type        = map(string)
  description = "resource specific tags"
  default     = null
}

variable "public_subnet_count" {
  type        = number
  description = "the number of public subnets to create"
  default     = 3
}

variable "private_subnet_count" {
  type        = number
  description = "the number of privates subnets to create"
  default     = 3
}
