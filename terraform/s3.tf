resource "aws_s3_bucket" "log_bucket" {
  bucket = "log-bucket-ac-dev"

}

data "aws_elb_service_account" "log_account"{} 
data "aws_caller_identity" "log_account_current" {}

resource "aws_s3_bucket_policy" "log_data_policy" {
  bucket = aws_s3_bucket.log_bucket.id
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
      aws_s3_bucket.log_bucket.arn,
      "${aws_s3_bucket.log_bucket.arn}/${data.aws_caller_identity.log_account_current.account_id}/*",
    ]
  }
}
