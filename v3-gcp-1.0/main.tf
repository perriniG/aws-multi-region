provider "google" {
  credentials = "${file(var.credentials)}"
  project     = "${var.project}"
  region      = "eu-west1"
}
