# resource "aws_s3_bucket" "altschool-static-bucket" {
#   bucket= "altschool-static-bucket"
#   force_destroy = true
# }
# Create a CloudFront distribution

resource "aws_cloudfront_distribution" "cloudfront" {
  origin {
    domain_name = var.s3-bucket.bucket_regional_domain_name
    origin_id   = var.s3-bucket.bucket

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.origin_access_identity.cloudfront_access_identity_path
    }
  }

  enabled             = true
  is_ipv6_enabled     = true
  comment             = "CloudFront distribution for naima"
  default_root_object = "index.html"


  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = var.s3-bucket.bucket

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  price_class = "PriceClass_100"

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

   viewer_certificate {
    acm_certificate_arn            = var.certificate_arn
    ssl_support_method              = "sni-only"
    minimum_protocol_version = "TLSv1.2_2018"
  }
}

# Create a CloudFront origin access identity
resource "aws_cloudfront_origin_access_identity" "origin_access_identity" {
  comment = "Origin Access Identity for naima"
}

# Attach bucket policy to allow CloudFront access
resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = var.s3-bucket.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          AWS = aws_cloudfront_origin_access_identity.origin_access_identity.iam_arn
        }
        Action = "s3:GetObject"
      Resource = [

        "${var.s3-bucket.arn}/*"
        ]
      }
    ]
  })
}