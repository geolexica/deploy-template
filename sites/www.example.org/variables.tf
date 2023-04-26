variable "aws_region" {
  default = "us-east-1"
}

variable "fqdn-root" {
  default = "example.org"
}

variable "fqdn-main" {
  default = "www.example.org"
}

variable "fqdn-test" {
  default = "www-staging.example.org"
}

variable "allowed_ips" {
  type    = list(string)
  default = []
}

variable "allowed_account_ids" {
  type    = list(string)
  default = ["123456789"]
}
