resource "google_storage_bucket" "tf-bucket-356452" {
  name     = "tf-bucket-356452"
  location = "US"
  force_destroy = true
}