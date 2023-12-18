resource "google_project_iam_custom_role" "fireflies-ai-gcp-byos" {
  role_id     = "firefliesai_gcp_byos_role_new"
  title       = "Fireflies AI BYOS Role New"
  description = "Fireflies AI BYOS Role"
  permissions = [
    "storage.objects.create",
    "storage.objects.delete",
    "storage.objects.get",
    "storage.objects.getIamPolicy",
    "storage.objects.list",
    "storage.objects.update"
  ]
}

resource "google_project_iam_binding" "project" {
  project = var.project_id
  role    = resource.google_project_iam_custom_role.fireflies-ai-gcp-byos.id

  members = [
    "serviceAccount:${var.service_account_email}",
  ]

  condition {
    title       = "limit_access_to_bucket"
    description = "Limit access to specific bucket"
    expression  = "resource.name.startsWith('projects/_/buckets/${resource.google_storage_bucket.fireflies-ai-gcp-byos-bucket.id}/objects/')"
  }
}