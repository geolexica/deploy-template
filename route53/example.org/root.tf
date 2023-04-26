resource "aws_route53_zone" "root" {
  name    = var.external_domain
  comment = var.external_domain
}

resource "aws_route53_record" "root-ns" {
  zone_id = aws_route53_zone.root.zone_id
  name    = var.external_domain
  type    = "NS"
  ttl     = "172800"

  records = [
    aws_route53_zone.root.name_servers[0],
    aws_route53_zone.root.name_servers[1],
    aws_route53_zone.root.name_servers[2],
    aws_route53_zone.root.name_servers[3],
  ]
}

resource "aws_route53_record" "root-soa" {
  zone_id = aws_route53_zone.root.id
  name    = aws_route53_zone.root.name
  type    = "SOA"
  records = [
    "${aws_route53_zone.root.name_servers[0]} awsdns-hostmaster.amazon.com. 1 7200 900 1209600 86400",
  ]
  ttl = "900"
}
