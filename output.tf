output "context" {
  value = var.context
}

output "context_string" {
  value = join(",", [for key, value in var.context : try("${key}=${value}", "")])
}

output "tags" {
  value = local.tags
}

output "azuread_tags" {
  value = [for key, value in local.tags : "${key}=${value}"]
}

output "project" {
  value = var.context.project
}

output "environment" {
  value = var.context.environment
}

output "env_alias" {
  value = local.env_alias
}

output "owner" {
  value = var.context.owner
}

output "team" {
  value = var.team
}

output "domain" {
  value = var.context.domain
}

output "region" {
  value = var.context.region
}

output "tenant_id" {
  value = var.context.tenant_id
}

output "subscription_id" {
  value = data.azurerm_client_config.current.subscription_id
}

output "client_object_id" {
  value = data.azuread_client_config.current.object_id
}