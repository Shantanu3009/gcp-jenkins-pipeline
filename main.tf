resource "google_storage_bucket" "my_bucket" {
  name     = "my-bucket-name"
  location = "US"
  storage_class = "STANDARD"
}
