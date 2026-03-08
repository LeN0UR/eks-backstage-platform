# Route53 Hosted Zone


resource "aws_route53_zone" "this" {
  name = var.domain_name
  tags = var.tags
}


# ACM Certificate (DNS Validated)


resource "aws_acm_certificate" "this" {
  domain_name       = var.app_domain_name
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }

  tags = var.tags
}

resource "aws_route53_record" "cert_validation" {
  for_each = {
    for dvo in aws_acm_certificate.this.domain_validation_options :
    dvo.domain_name => dvo
  }

  zone_id = aws_route53_zone.this.zone_id

  name    = each.value.resource_record_name
  type    = each.value.resource_record_type
  records = [each.value.resource_record_value]
  ttl     = 60
}

resource "aws_acm_certificate_validation" "this" {
  certificate_arn         = aws_acm_certificate.this.arn
  validation_record_fqdns = [
    for record in aws_route53_record.cert_validation :
    record.fqdn
  ]
}