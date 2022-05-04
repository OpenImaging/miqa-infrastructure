resource "aws_route53_record" "client" {
  zone_id = data.aws_route53_zone.this.zone_id
  name    = "miqa"
  type    = "CNAME"
  ttl     = "300"
  records = ["keen-hamilton-960da4.netlify.app."]
}
