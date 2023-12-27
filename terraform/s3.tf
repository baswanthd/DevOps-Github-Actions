resource "aws_s3_bucket" "log_bucket" {
  bucket = "log-bucket-ac-dev"

}

data "aws_iam_policy_document" "log_data" {
  statement {
    sid = "1"

    actions = [
      "s3:ListAllMyBuckets",
      "s3:GetBucketLocation",
    ]

    resources = [
      "arn:aws:s3:::*",
    ]
  }

  statement {
    actions = [
      "s3:ListBucket",
    ]

    resources = [
      data.aws_s3_bucket.log_bucket.arn,
    ]
  }
}
