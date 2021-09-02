resource "random_id" "bucket_suffix" {
  byte_length = 4
}

#tfsec:ignore:AWS002 tfsec:ignore:AWS017 tfsec:ignore:AWS077
resource "aws_s3_bucket" "default" {
  bucket = "areionsec-${var.local_name}-${random_id.bucket_suffix.hex}"
  acl    = "private"

  versioning {
    enabled = var.versioning
  }

  dynamic "website" {
    for_each = var.spa_website_document != null ? [var.spa_website_document] : []
    content {
      index_document = website.value
      error_document = website.value
    }
  }

  tags = var.tags
}

resource "aws_s3_bucket_public_access_block" "default" {
  bucket = aws_s3_bucket.default.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
