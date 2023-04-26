output "main_s3_bucket_id" {
  value = module.main.s3_bucket_id
}

output "main_s3_domain" {
  value = module.main.s3_website_endpoint
}

output "main_s3_hosted_zone_id" {
  value = module.main.s3_hosted_zone_id
}

output "main_cloudfront_domain" {
  value = module.main.cf_domain_name
}

output "main_cloudfront_hosted_zone_id" {
  value = module.main.cf_hosted_zone_id
}

output "main_cloudfront_distribution_id" {
  value = module.main.cf_distribution_id
}

output "main_route53_fqdn" {
  value = aws_route53_record.main.fqdn
}

output "main_acm_certificate_arn" {
  value = aws_acm_certificate_validation.cert-main.certificate_arn
}

output "test_s3_bucket_id" {
  value = module.test.s3_bucket_id
}

output "test_s3_domain" {
  value = module.test.s3_website_endpoint
}

output "test_s3_hosted_zone_id" {
  value = module.test.s3_hosted_zone_id
}

output "test_cloudfront_domain" {
  value = module.test.cf_domain_name
}

output "test_cloudfront_hosted_zone_id" {
  value = module.test.cf_hosted_zone_id
}

output "test_cloudfront_distribution_id" {
  value = module.test.cf_distribution_id
}

output "test_route53_fqdn" {
  value = aws_route53_record.test.fqdn
}

output "test_acm_certificate_arn" {
  value = aws_acm_certificate_validation.cert-test.certificate_arn
}

output "user-deploy-access-key-id" {
  value = aws_iam_access_key.deploy.id
}

output "user-deploy-access-key-secret" {
  value = aws_iam_access_key.deploy.secret
}

