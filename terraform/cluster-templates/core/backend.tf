terraform {
  cloud {
    hostname = "app.terraform.io"
    organization = "weaveworks"

    workspaces {
      name = "dev"
    }
  }
}
