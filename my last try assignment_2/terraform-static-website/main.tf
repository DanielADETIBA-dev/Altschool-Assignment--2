provider "aws" {
  region = var.aws-region
}

module "aws_bucket" {
  source="./modules/s3_bucket"
  bucket_name = var.s3-bucket-name
  # s3-bucket-name=var.s3-bucket-name
}

module "aws_cloudfront" {
  source="./modules/cloudfront"
  s3-bucket=module.aws_bucket.s3-bucket
  certificate_arn=module.certificate.acm_certificate.arn
  domain_name=var.domain-name
  # s3_bucket_regional_domain_name = module.aws_bucket.bucket_regional_domain_name 

}
module "route53" {
  source = "./modules/route53"
  domain-name = var.domain-name
  env = var.env
  cloudfront_domain_name = module.aws_cloudfront.aws_cloudfront.domain_name
  cloudfront_hosted_zone_id = module.aws_cloudfront.aws_cloudfront.hosted_zone_id
  
}

module "certificate" {
  source = "./modules/certificate"
  domain-name = var.domain-name
  aws_route53_zone_id=module.route53.route53.zone_id
}

# resource "aws_route53_zone" "main" {
#     name=var.domain-name  
#     tags={
#         Environment=var.env
#     }
# }

# resource "aws_route53_record" "www" {
#   zone_id = aws_route53_zone.main.zone_id
#   name    = "www"
#   type    = "A"
#   alias {
#     name                   = module.aws_cloudfront.aws_cloudfront.domain_name
#     zone_id                = module.aws_cloudfront.aws_cloudfront.hosted_zone_id
#     evaluate_target_health = false
#   }
# }
