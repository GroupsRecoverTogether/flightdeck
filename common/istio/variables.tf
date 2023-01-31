variable "base_chart_name" {
  type        = string
  description = "Name of the Istio base chart"
  default     = "base"
}

variable "base_chart_repository" {
  type        = string
  description = "Helm repository containing the Istio base chart"
  default     = "https://istio-release.storage.googleapis.com/charts"
}

variable "base_chart_values" {
  description = "Overrides to pass to the Helm chart"
  type        = list(string)
  default     = []
}

variable "discovery_chart_name" {
  type        = string
  description = "Name of the Istio discovery chart"
  default     = "istio/istiod"
}

variable "discovery_chart_repository" {
  type        = string
  description = "Helm repository containing the Istio discovery chart"
  default     = "https://istio-release.storage.googleapis.com/charts"
}

variable "discovery_chart_values" {
  description = "Overrides to pass to the Helm chart"
  type        = list(string)
  default     = []
}

variable "istio_version" {
  type        = string
  description = "Version of Istio to be installed"
  default     = null
}

variable "k8s_namespace" {
  type        = string
  description = "Kubernetes namespace in which secrets should be created"
  default     = "istio-system"
}
