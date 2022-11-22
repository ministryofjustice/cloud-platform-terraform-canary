variable "canary_bucket" {
  description = "Module needs an existing bucket to put output in"
  type        = string
}

variable "canary_name" {
  description = "The name of the canary will be prepended with team_name"
  type        = string
}

variable "hostname" {
  description = "the hostname for the canary request"
  type        = string
}

variable "endpointpath" {
  description = "path - appended to the hostname for full api request"
  type        = string
}

variable "port" {
  description = "port to target request on"
  type        = string
}

variable "team_name" {
  type        = string
  description = "Team name"
}

variable "application" {
  type        = string
  description = "Application name"
}

variable "environment" {
  type        = string
  description = "Environment name"
}

variable "is_production" {
  default     = "false"
  description = "Whether the environment is production or not"
  type        = string
}

variable "namespace" {
  default     = ""
  description = "Namespace name"
  type        = string
}

variable "business_unit" {
  description = "Area of the MOJ responsible for the service"
  default     = ""
  type        = string
}

variable "infrastructure_support" {
  description = "The team responsible for managing the infrastructure. Should be of the form <team-name> (<team-email>)"
  type        = string
}
