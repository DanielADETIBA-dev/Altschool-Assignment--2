

# output "acm-cert" {
#   value = aws_acm_certificate.cert.arn
#   # sensitive = true
# }
# output "OAC" {
#   value = aws_cloudfront_origin_access_identity.origin_access_identity
# }

output "s3-bucket" {
  value = module.aws_bucket
}