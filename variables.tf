variable "context" {
  type = object({
    project     = string # project name is usally account's project name or platform name
    region      = string # describe default region to create a resource
    environment = string # Distinguish between development, test, and production resources
    department  = string # Organization name of BSP
    owner       = string # Identify who is responsible for the resource
    customer    = string # Identify a specific client that a particular group of resources serves
    domain      = string # public toolchain domain name (ex, tools.customer.co.kr)
    tenant_id   = string # Azure Tenant ID
  })
}

variable "team" {
  description = "The of team"
  type        = string
  default     = null
}

variable "owner" {
  description = "resource owner. like email"
  type        = string
  default     = null
}

variable "additional_tags" {
  description = "Additional tags for all resources"
  type        = map(string)
  default     = {}
}

variable "provisioner" {
  description = "Provisioner tool like terraform, cloudformation"
  type        = string
  default     = "Terraform"
}
