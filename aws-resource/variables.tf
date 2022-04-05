variable "resource_name" {
  type = string
}

# EKS
variable "eks" {
  type = object({
    cluster_version = string
    manage_node_groups = map(object({
      node_name       = string
      desired_size    = number
      instance_types  = string
      create_iam_role = bool
      iam_role_name   = string
      iam_role_arn    = string
    }))
  })
}

# NLB
variable "nlb" {
  type = object({
    target_groups = object({
      backend_protocol = string
      backend_port     = number
      target_type      = string
    })
    http_tcp_listeners = map(object({
      port = number
    }))
  })
}
# access_logs    = map(string)

variable "vpc" {
  type = object({
    vpc_cidr = string
    vpc_list = map(list(string))
  })
}

# RDS
variable "rds" {
  type = map(map(string))
}

# update-kubeconfig
variable "update-kubeconfig" {
  type = string
}

# provider-aws
variable "profile" {
  type = string
}
variable "region" {
  type = string
}
