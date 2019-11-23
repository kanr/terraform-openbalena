# main.tf

terraform {
    backend "remote" {
        hostname = "app.terraform.io"
        organization = "terraformers"

        workspaces {
            name = "openbalena"
        }

    }
}

provider "aws" {
  profile    = "default"
  region     = "us-east-1"
}


