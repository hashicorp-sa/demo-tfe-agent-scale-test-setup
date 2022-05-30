variable "aws_region" {
  default = "us-west-1"
}

variable "agent_count" {
  type = number
  default = 300
}

variable "agent_cpu" {
  type = number
  default = 1024
}

variable "agent_memory" {
  type = number
  default = 2048
}

variable "ip_cidr_vpc" {
  description = "IP CIDR for VPC"
  default     = "172.31.0.0/16"
}

variable "ip_cidr_agent_subnet" {
  description = "IP CIDR for tfc-agent subnet"
  default     = "172.31.16.0/24"
}

variable "workspace_count" {
  type = number
  default = 1600
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