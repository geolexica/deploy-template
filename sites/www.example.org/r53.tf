data "aws_route53_zone" "main" {
  provider     = aws.main
  name         = var.fqdn-root
  private_zone = false
}

resource "aws_route53_record" "main" {
  provider = aws.main
  zone_id  = data.aws_route53_zone.main.zone_id
  name     = var.fqdn-main
  type     = "A"

  alias {
    name                   = module.main.cf_domain_name
    zone_id                = module.main.cf_hosted_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "test" {
  provider = aws.main
  zone_id  = data.aws_route53_zone.main.zone_id
  name     = var.fqdn-test
  type     = "A"

  alias {
    name                   = module.test.cf_domain_name
    zone_id                = module.test.cf_hosted_zone_id
    evaluate_target_health = false
  }
}

