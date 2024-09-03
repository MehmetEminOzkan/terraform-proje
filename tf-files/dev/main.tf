terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket = "contactlist-backend-emin"
    key = "env/dev/tf-remote-backend.tfstate"
    region = "us-east-1"
    dynamodb_table = "tf-s3-app-lock"
    encrypt = true
  }
}


module "contactlist" {
  source   = "../modules"
  git-user = "MehmetEminOzkan"
  key-name = "firstkey"
  hosted-zone = "samdevops.link"
  env = "dev"
}

output "websiteurl" {
  value = module.contactlist.websiteurl
}