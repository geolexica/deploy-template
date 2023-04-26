module "main" {
  source = "github.com/riboseinc/terraform-aws-s3-cloudfront-website"

  fqdn                = var.fqdn-main
  ssl_certificate_arn = aws_acm_certificate_validation.cert-main.certificate_arn
  allowed_ips         = var.allowed_ips

  index_document = "index.html"
  error_document = "404.html"

  acceleration_status = "Enabled"
  bucket_name = replace(var.fqdn-main, ".", "-")

  refer_secret = base64sha512("MYSECRET1234567${var.fqdn-main}")

  force_destroy = "true"

  providers = {
    aws.main       = aws.main
    aws.cloudfront = aws.cloudfront
  }
}

