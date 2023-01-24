terraform {
  required_version = ">= 1.1.0"
  cloud {
    hostname = "app.terraform.io"
    organization = "terraform-controller-demo"

    workspaces {
      name = "example2"
    }
  }

  required_providers {
   aws = {
     source  = "hashicorp/aws"
     version = "3.23.0"
   }
  }
}