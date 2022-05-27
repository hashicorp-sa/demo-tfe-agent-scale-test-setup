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
  name  = "agents-test"
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
  name         = "${var.prefix}-${count.index}"
  description  = "${var.prefix}-${count.index}"
  organization = tfe_organization.test.name
  queue_all_runs = false

  vcs_repo {
      identifier = var.repository_name
      oauth_token_id  = data.tfe_oauth_client.csa.oauth_token_id
  }
}