terraform {
  cloud {
    organization = "dsg-dev-02"
    hostname     = "app.terraform.io"
    token        = "POzNYA14trvnQQ.atlasv1.b7oscLuYL63n75NJEGhjQEyqFV6lI66mAAiF6l0vQOvZ9yu742KyYkHACWlBz64QCXY"

    workspaces {
      name = "workspace-1"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.36"
    }
  }
}
/*terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.36"
    }
  }
}*/

provider "aws" {
  profile = "default"
  region  = "us-west-2"
}

module "app_server" {
  source = "./modules/application"

  ec2_instance_type    = "t2.micro"
  ami = "ami-098e42ae54c764c35"
  tags = {
    Name = "TFE_WEB"
    Env = "ec2-dev"
  }
}

module "app_storage" {
  source = "./modules/storage/"

  bucket_name     = "io.abishaip.tfe-bucket"
  env = "s3-dev"
}