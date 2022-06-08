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
  agent_pool_id  = tfe_agent_pool.test-agent-pool[count.index % var.pool_count].id
  execution_mode = "agent"
  auto_apply = true
}

resource "tfe_agent_pool" "test-agent-pool" {
  count        = var.pool_count
  name         = "${var.prefix}-${count.index + 1}"
  organization = tfe_organization.test.id
}

resource "tfe_agent_token" "test-agent-token" {
  count        = var.pool_count
  agent_pool_id = tfe_agent_pool.test-agent-pool[count.index].id
  description   = "${var.prefix}-${count.index + 1}"
}