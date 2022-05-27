variable "agent_count" {
  type = number
  default = 300
}

variable "agent_cpu" {
  type = number
  default = 1
}

variable "agent_memory" {
  type = number
  default = 1
}

variable "workspace_count" {
  type = number
  default = 1600
}

variable "github_oauth_token" {
  type        = string
  description = "The OAuth token (GitHub PAT token)."
}

variable "tfe_hostname" {
  type        = string
  description = "The hostname of the Terraform Enterprise server."
}

variable "prefix" {
  type        = string
  description = "The prefix to use for the Terraform Cloud workspace names."
  default = "test-agents"
}

variable "repository_name" {
  type = string
  default = "HashiCorp-CSA/demo-tfe-scale-test-demo-code"
}