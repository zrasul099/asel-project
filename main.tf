terraform {
  backend "s3" {
    bucket = "terraform-admin"
    key    = "dev.tfstate"
    region = "us-east-2"
    # shared_credentials_file = "~/.aws/credentials"
  }
}

provider "aws" {
  region = "us-east-2"
  # shared_credentials_file = "~/.aws/credentials"
}

resource "aws_ecr_repository" "my_ecr_repo" {
  name                 = "my-ecr-repo"
  image_tag_mutability = "IMMUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
}