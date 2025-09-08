locals {
  environment = lower(var.context.environment)
  env_alias   = substr(local.environment, 0, 1)
  owner       = var.owner != null ? var.owner : var.context.owner

  local_tags = {
    Project     = var.context.project
    Environment = var.context.environment
    Department  = var.context.department
    Owner       = local.owner
    Customer    = var.context.customer
    ManagedBy   = var.provisioner
  }

  tags = merge(
    (var.team != null ? {
      Team = var.team
    } : {}),
    local.local_tags,
    var.additional_tags
  )
}