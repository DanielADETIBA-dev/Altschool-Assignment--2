# variable "s3-bucket-name" {}
variable "bucket_name" {}
variable "mime_types" {
  description = "A map of file extensions to MIME types"
  type        = map(string)
  default = {
    html = "text/html",
    css  = "text/css",
    js   = "application/javascript",
    png  = "image/png",
    jpg  = "image/jpeg",
    gif  = "image/gif"
  }
}