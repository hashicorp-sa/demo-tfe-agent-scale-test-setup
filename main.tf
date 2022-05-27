terraform {
  required_providers {
    tfe = {
    }
  }
}

provider "tfe" {
    hostname = var.tfe_hostname
}

resource "tfe_organization" "test" {
  name  = var.prefix
  email = "demo@hashicorp.com"
}

resource "tfe_workspace" "csa" {
  count        = var.workspace_count
  name         = "${var.prefix}-${format("%04d" ,count.index + 1)}"
  description  = "${var.prefix}-${format("%04d" ,count.index + 1)}"
  organization = tfe_organization.test.name
  queue_all_runs = false
}