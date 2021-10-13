resource "aws_s3_bucket" "s3_bucket" {
  bucket = "terra9573"
  acl    = "private"

  versioning {
    enabled = true
  }
  
  tags = {
    Name        = "terra9573"
    Environment = "Dev"
  }
}