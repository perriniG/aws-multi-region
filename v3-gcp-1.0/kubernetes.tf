resource "google_container_cluster" "gcp_kubernetes" {
   name               = "${var.cluster_name}"
   zone               = "eu-west1-a"
   initial_node_count = "${var.gcp_cluster_count}"

   additional_zones = [
     "eu-west1-b",
     "eu-west1-c",
   ]

   master_auth {
     username = "${var.linux_admin_username}"
     password = "${var.linux_admin_password}"
   }

   node_config {
     oauth_scopes = [
       "https://www.googleapis.com/auth/compute",
       "https://www.googleapis.com/auth/devstorage.read_only",
       "https://www.googleapis.com/auth/logging.write",
       "https://www.googleapis.com/auth/monitoring",
     ]

     labels = {
       this-is-for = "dev-cluster"
     }

     tags = ["dev", "work"]
   }
 }


     ## Connect to cluster after creating it

 resource "null_resource" "connect-cluster" {
 depends_on = ["google_container_cluster.gcp_kubernetes"]
 provisioner "local-exec" {
     command = "gcloud container clusters get-credentials ${var.cluster_name} --zone eu-west1-a --project boosty-test-dev"
     interpreter = ["bash", "-c"]
 }
 }