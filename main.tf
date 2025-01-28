resource "google_storage_bucket" "my_bucket" {
  name          = "jenkins-pipeline-bucket"
  location      = "US"
  storage_class = "STANDARD"
  project       = "shan-practice-dev"
}

