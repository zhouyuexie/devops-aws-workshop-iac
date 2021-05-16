resource "aws_s3_bucket" "terraform_state" {
  bucket = "devops-workshop-terraform-state-${var.developer_name}"

  versioning {
    enabled = true
  }

  lifecycle_rule {
    enabled = true
    prefix  = ""

    noncurrent_version_expiration {
      days = 7
    }
  }
}

resource "aws_dynamodb_table" "terraform_state" {
  name           = "terraform-state-lock-${var.developer_name}"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}