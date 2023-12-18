resource "google_project_iam_custom_role" "ff-byos-object-permissions" {
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

resource "google_project_iam_custom_role" "bucket-permissions" {
  role_id     = "firefliesai_gcp_byos_bucket_role"
  title       = "Fireflies AI BYOS Bucket Role"
  description = "Fireflies AI BYOS Bucket Role"
  permissions = [
    "storage.buckets.list",
    "storage.buckets.get",
    "storage.buckets.getIamPolicy"
  ]
}


resource "google_project_iam_binding" "project" {
  project = var.project_id
  role    = resource.google_project_iam_custom_role.ff-byos-object-permissions.id

  members = [
    "serviceAccount:${var.service_account_email}",
  ]

  condition {
    title       = "limit_access_to_objects"
    description = "Limit object access to specific buckets"
    expression  = "resource.name.startsWith('projects/_/buckets/${var.bucket_name}/objects/')"
  }
}

resource "google_project_iam_binding" "bucket" {
  project = var.project_id
  role    = resource.google_project_iam_custom_role.bucket-permissions.id

  members = [
    "serviceAccount:${var.service_account_email}",
  ]

  condition {
    title       = "read_bucket_metadata"
    description = "Read Bucket Metadata"
    expression  = "resource.name.startsWith('projects/_/buckets/')"
  }
}