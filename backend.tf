terraform {
  backend "s3" {
    bucket = "mybucket-yousra"
    key    = "terraform.tfstate"
    region = "us-east-1"
    encrypt        = true            
  }
}

