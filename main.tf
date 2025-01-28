resource "google_storage_bucket" "my_bucket" {
  name          = "jenkins-pipeline-bucket"
  location      = "us-central1"
  storage_class = "STANDARD"
  project       = "shan-practice-dev"
}


