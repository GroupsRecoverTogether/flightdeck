variable "admin_roles" {
  type        = list(string)
  description = "IAM roles which will have admin privileges in this cluster"
}

variable "aws_tags" {
  type        = map(string)
  description = "Tags to be applied to created AWS resources"
  default     = {}
}

variable "cluster_full_name" {
  type        = string
  description = "Full name of the EKS cluster"
}

variable "custom_roles" {
  type        = map(string)
  description = "Additional IAM roles which have custom cluster privileges"
  default     = {}
}

variable "hosted_zones" {
  type        = list(string)
  description = "Hosted zones this cluster is allowed to update"
  default     = []
}

variable "k8s_namespace" {
  type        = string
  default     = "flightdeck"
  description = "Kubernetes namespace in which resources should be created"
}

variable "logs_retention_in_days" {
  type        = number
  default     = 30
  description = "Number of days for which logs should be retained"
}

variable "node_roles" {
  type        = list(string)
  description = "Additional node roles which can join the cluster"
  default     = []
}

variable "pagerduty_parameter" {
  type        = string
  description = "SSM parameter containing the Pagerduty routing key"
  default     = null
}
