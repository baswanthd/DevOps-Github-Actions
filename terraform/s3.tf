resource "aws_s3_bucket" "log-bucket-central" {
  bucket = "log-bucket-central"

}

data "aws_elb_service_account" "log_account"{} 
data "aws_caller_identity" "log_account_current" {}

resource "aws_s3_bucket_policy" "log_data_policy" {
  bucket = aws_s3_bucket.log-bucket-central.id
  policy = data.aws_iam_policy_document.log_data.json
}

data "aws_iam_policy_document" "log_data" {
   statement {
    principals {
      type        = "AWS"
      identifiers = [data.aws_elb_service_account.log_account.arn]
    } 

    actions = [
      "s3:PutObject",
    ]

    resources = [
      #aws_s3_bucket.log_bucket.arn,
      "${aws_s3_bucket.log-bucket-central.arn}/log/AWSLogs/${data.aws_caller_identity.log_account_current.account_id}/*",
    ]
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "log_encryption" {
  bucket = aws_s3_bucket.log-bucket-central.id
  rule {
    apply_server_side_encryption_by_default {
      # kms_master_key_id = aws_kms_key.mykey.arn # there is a default one
      sse_algorithm     = "aws:kms"
    }
  }
}
