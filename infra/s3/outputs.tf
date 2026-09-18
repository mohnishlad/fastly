output "bucket_name" {
  description = "Name of the created static site bucket."
  value       = aws_s3_bucket.site.bucket
}

output "bucket_arn" {
  description = "ARN of the created static site bucket."
  value       = aws_s3_bucket.site.arn
}

output "website_endpoint" {
  description = "S3 static website endpoint for the bucket."
  value       = "http://${aws_s3_bucket.site.bucket}.s3-website-${var.aws_region}.amazonaws.com"
}
