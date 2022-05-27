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

resource "tfe_oauth_client" "test" {
  name             = "test_token"
  organization     = tfe_organization.test.name
  api_url          = "https://api.github.com"
  http_url         = "https://github.com"
  oauth_token      = var.github_oauth_token
  service_provider = "github"
}

resource "tfe_workspace" "csa" {
  count        = var.workspace_count
  name         = "${var.prefix}-${format("%04d" ,count.index + 1)}"
  description  = "${var.prefix}-${format("%04d" ,count.index + 1)}"
  organization = tfe_organization.test.name
  queue_all_runs = false

  vcs_repo {
      identifier = var.repository_name
      oauth_token_id  = tfe_oauth_client.test.oauth_token_id
  }
}