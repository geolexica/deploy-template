provider "aws" {
  region              = "us-west-2"
  allowed_account_ids = var.allowed_account_ids

  #description = "AWS Region for S3 and other resources"
  alias = "main"
}

provider "aws" {
  region              = "us-east-1"
  allowed_account_ids = var.allowed_account_ids

  #description = "AWS Region for Cloudfront (ACM certs only supports us-east-1)"
  alias = "cloudfront"
}

