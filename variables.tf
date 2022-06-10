variable "tfe_hostname" {
  type        = string
  description = "The hostname of the Terraform Enterprise server (e.g. mytfe.com)."
}

variable "prefix" {
  type        = string
  default     = "test-agents"
  description = "The prefix to use for the Terraform Enterprise workspace names (they will follow the {prefix}-0000 format)."
}

variable "workspace_count" {
  type        = number
  default     = 1600
  description = "The number of workspaces to create in Terraform Enterprise."
}

variable "pool_count" {
  type        = number
  default     = 16
  description = "The number of agent pools and associated ECS services to create."
}

variable "agent_per_pool_count" {
  type        = number
  default     = 50
  description = "The number of agents per agent pools and associated containers per ECS service."
}

variable "aws_region" {
  type        = string
  default     = "us-west-1"
  description = "The AWS region to deploy the ECS cluster in."
}

variable "agent_cpu" {
  type        = number
  default     = 1024
  description = "The CPU capacity per agent container."
}

variable "agent_memory" {
  type        = number
  default     = 2048
  description = "The memory capacity per agent container."
}

variable "ip_cidr_vpc" {
  type        = string
  default     = "172.31.0.0/16"
  description = "The IP CIDR for the AWS VPC."
}

variable "ip_cidr_agent_subnet" {
  type        = string
  default     = "172.31.0.0/16"
  description = "IP CIDR for tfc-agent subnet - Make sure you have enough address space for all the containers (pool_count * agent_per_pool_count)!"
}

variable "standard_tags" {
  type = map(string)
  default = {
    "owner"           = "TBC"
    "purpose"         = "Setup multiple agents and workspaces for Terraform Enterprise / Cloud Scale testing"
    "ttl"             = "7d"
    "terraform"       = "true"
    "internet-facing" = "false"
  }
  description = "The tags to apply to all resources in AWS."
}

variable "organization_owner" {
  type        = string
  default     = "demo@hashicorp.com"
  description = "The email address of the organization owner for the Terraform Enterprise organization that gets created."
}