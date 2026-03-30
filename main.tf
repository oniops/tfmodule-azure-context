locals {
  environment  = lower(var.context.environment)
  env_alias    = substr(local.environment, 0, 1)
  region_alias = lookup(local.az_region_codes, var.context.region, "nn")
  owner        = var.owner != null ? var.owner : var.context.owner

  local_tags = {
    project     = var.context.project
    environment = var.context.environment
    department  = var.context.department
    owner       = local.owner
    customer    = var.context.customer
    managed-by  = var.provisioner
  }

  name_prefix = "${var.context.project}-${local.region_alias}${local.env_alias}"

  tags = merge(
    (var.cost_center != null ? { cost-center = var.cost_center } : {}),
    (var.team != null ? { Team = var.team } : {}),
    local.local_tags,
    var.additional_tags
  )

  az_region_codes = {
    koreacentral = "kc"
  }
}
