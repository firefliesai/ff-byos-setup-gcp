# This is a placeholder for the bucket. You are free to edit/change the settings as per your requirements. However, do consult fireflies team before making any changes.

# Please make sure that the cors configuration is applied to the bucket if it is already created. 

resource "google_storage_bucket" "fireflies-ai-gcp-byos-bucket" {
  name          = var.bucket_name
  location      = "US"
  force_destroy = true
  public_access_prevention = "enforced"

  cors {
    origin          = ["*"]
    method          = ["GET", "HEAD", "PUT", "POST", "DELETE"]
    response_header = ["*"]
    max_age_seconds = 3600
  }
}


# output "bucket_name" {
#   value = resource.google_storage_bucket.fireflies-ai-gcp-byos-bucket.id
# }
