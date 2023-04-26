resource "aws_acm_certificate" "cert-main" {
  provider          = aws.cloudfront
  domain_name       = var.fqdn-main
  validation_method = "DNS"
}

resource "aws_route53_record" "cert_validation-main" {
  provider = aws.cloudfront
  name     = aws_acm_certificate.cert-main.domain_validation_options[0].resource_record_name
  type     = aws_acm_certificate.cert-main.domain_validation_options[0].resource_record_type
  zone_id  = data.aws_route53_zone.main.id
  records  = [aws_acm_certificate.cert-main.domain_validation_options[0].resource_record_value]
  ttl      = 60
}

resource "aws_acm_certificate_validation" "cert-main" {
  provider                = aws.cloudfront
  certificate_arn         = aws_acm_certificate.cert-main.arn
  validation_record_fqdns = [aws_route53_record.cert_validation-main.fqdn]
}

