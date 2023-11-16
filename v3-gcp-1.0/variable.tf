// General Variables

variable "credentials" {
type = string
default = "../key.json"
description = "Json Credentials file to connect GCP"
}

variable "linux_admin_username" {
type = string
description = "User name for authentication to the Kubernetes linux agent virtual machines in the cluster."
default = "glb-events"
}

variable "linux_admin_password" {
type =string
default = "sharedband"
description = "The password for the Linux admin account."
}

// GCP Variables
variable "gcp_cluster_count" {
type = string
description = "Count of cluster instances to start."
default = "1"
}
variable "project" {
  type = string
  default = "boosty-test-dev"
}

variable "cluster_name" {
type = string
description = "Cluster name for the GCP Cluster."
default = "v3-kubernetes"
}