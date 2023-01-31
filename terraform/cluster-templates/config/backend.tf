terraform {
  cloud {
    hostname = "app.terraform.io"
    organization = "terraform-controller-demo"

    workspaces {
      name = "asdfg"
    }
  }
}
