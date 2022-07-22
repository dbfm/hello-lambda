resource "aws_s3_bucket" "state-bucket" {
  bucket = "hello-lambda-tfstate"
}

resource "aws_s3_bucket_acl" "state-bucket" {
  bucket = aws_s3_bucket.state-bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "state-bucket" {
  bucket = aws_s3_bucket.state-bucket.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# uncomment the versioning resource below before use in production

# resource "aws_s3_bucket_versioning" "state-bucket" {
#   bucket = aws_s3_bucket.state-bucket.id
#   versioning_configuration {
#     status = "Enabled"
#   }
# }
