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
  agent_pool_id  = tfe_agent_pool.test-agent-pool.id
  execution_mode = "agent"
}

resource "tfe_agent_pool" "test-agent-pool" {
  name         = var.prefix
  organization = tfe_organization.test.id
}

resource "tfe_agent_token" "test-agent-token" {
  agent_pool_id = tfe_agent_pool.test-agent-pool.id
  description   = var.prefix
}