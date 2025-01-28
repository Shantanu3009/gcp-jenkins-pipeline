resource "google_cloud_bucket" "my-bucket" {
name          = "shan-github-bucket-1"
project       = "shan-practice-dev"
location      = "US"
force_destroy = true
public_access_prevention = "enforced"
}
