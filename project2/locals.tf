locals {
  profile                   = "hybriaccess"
  name                      = "terraform-v3"
  stage                     = "test"
  region                    = terraform.workspace == "eu-west-2"

  allowed_ips               = ["0.0.0.0/0"]
  key_name                  = file("devops.pem.pub")
  instance_type             = "t2.small"
  min_size                  = 2
  max_size                  = 10
  enabled_cluster_log_types = ["api", "audit", "authenticator", "controllerManager", "scheduler"]

  vpc_cidr = "10.0.0.0/16"

  private_subnets_cidrs = [
    "10.0.1.0/24",
    "10.0.2.0/24",
    "10.0.3.0/24"
  ]

  public_subnets_cidrs = [
    "10.0.101.0/24",
    "10.0.102.0/24",
    "10.0.103.0/24"
  ]

  config_map_aws_auth = <<CONFIGMAPAWSAUTH
apiVersion: v1
kind: ConfigMap
metadata:
  name: aws-auth
  namespace: kube-system
data:
  mapRoles: |
    - rolearn: ${aws_iam_role.eks_worker.arn}
      username: system:node:{{EC2PrivateDNSName}}
      groups:
        - system:bootstrappers
        - system:nodes
CONFIGMAPAWSAUTH
}