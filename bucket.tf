# This is a placeholder for the bucket. You are free to edit/change the settings as per your requirements. However, do consult fireflies team before making any changes.

resource "google_storage_bucket" "fireflies-ai-gcp-byos-bucket" {
  name          = var.bucket_name
  location      = "US"
  force_destroy = true
  public_access_prevention = "enforced"
}

# data "google_iam_policy" "admin" {
#   binding {
#     role = "roles/storage.admin"
#     members = [
#       "user:jane@example.com",
#     ]
#   }
# }

# resource "google_storage_bucket_iam_policy" "policy" {
#   bucket = google_storage_bucket.default.name
#   policy_data = data.google_iam_policy.admin.policy_data
# }


output "bucket_name" {
  value = resource.google_storage_bucket.fireflies-ai-gcp-byos-bucket.id
}
