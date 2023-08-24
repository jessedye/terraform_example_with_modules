resource "aws_s3_bucket" "this" {
  for_each = local.buckets_clean

  bucket        = var.bucket_name
  force_destroy = var.force_destroy

  tags = local.tags
}
