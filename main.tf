resource "random_id" "bucket_suffix" {
  byte_length = 4
}

#tfsec:ignore:AWS002 tfsec:ignore:AWS017 tfsec:ignore:AWS077
resource "aws_s3_bucket" "default" {
  bucket = "random-bucket"
  acl    = "private"

  versioning {
    enabled = var.versioning
  }

  tags = var.tags
}

