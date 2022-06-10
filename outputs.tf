output "counts" {
  value = {
    workspaces            = var.workspace_count
    agent_pools           = var.pool_count
    agents_per_agent_pool = var.agent_per_pool_count
    total_agents          = var.pool_count * var.agent_per_pool_count
  }
  description = "The counts of workspaces and agents created."
}