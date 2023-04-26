module "test" {
  source = "github.com/riboseinc/terraform-aws-s3-cloudfront-website"

  fqdn                = var.fqdn-test
  ssl_certificate_arn = aws_acm_certificate_validation.cert-test.certificate_arn
  allowed_ips         = var.allowed_ips

  index_document = "index.html"
  error_document = "404.html"

  acceleration_status = "Enabled"
  bucket_name = replace(var.fqdn-test, ".", "-")

  refer_secret = base64sha512("MYSECRET1234567${var.fqdn-test}")

  force_destroy = "true"

  providers = {
    aws.main       = aws.main
    aws.cloudfront = aws.cloudfront
  }
}

