output "s3-bucket" {
  value=aws_s3_bucket.altschool-static-bucket
}

output "aws_s3_object" {
  value=aws_s3_object.myapp
}