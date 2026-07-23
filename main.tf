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

  name_prefix       = "${var.context.project}-${local.region_alias}${local.env_alias}"
  camel_name_prefix = "${var.context.project}${title(local.region_alias)}${local.env_alias}"

  tags = merge(
    (var.cost_center != null ? { cost-center = var.cost_center } : {}),
    (var.team != null ? { team = var.team } : {}),
    local.local_tags,
    var.additional_tags
  )

  az_region_codes = {
    australiacentral   = "ac"
    australiacentral2  = "ac2"
    australiaeast      = "ae"
    australiasoutheast = "as"
    austriaeast        = "aue"
    belgiumcentral     = "bc"
    brazilsouth        = "bs"
    brazilsoutheast    = "brs"
    canadacentral      = "cc"
    canadaeast         = "ce"
    centralindia       = "ci"
    centralus          = "cu"
    chilecentral       = "chc"
    denmarkeast        = "de"
    eastasia           = "ea"
    eastus             = "eu"
    eastus2            = "eu2"
    francecentral      = "fc"
    francesouth        = "fs"
    germanynorth       = "gn"
    germanywestcentral = "gwc"
    indonesiacentral   = "ic"
    israelcentral      = "isc"
    italynorth         = "in"
    japaneast          = "je"
    japanwest          = "jw"
    koreacentral       = "kc"
    koreasouth         = "ks"
    malaysiawest       = "mw"
    mexicocentral      = "mc"
    newzealandnorth    = "mzn"
    northcentralus     = "ncu"
    northeurope        = "ne"
    norwayeast         = "noe"
    norwaywest         = "nw"
    polandcentral      = "pc"
    qatarcentral       = "qc"
    southafricanorth   = "san"
    southafricawest    = "saw"
    southcentralus     = "sc"
    southindia         = "si"
    southeastasia      = "sa"
    spaincentral       = "spc"
    swedencentral      = "sw"
    switzerlandnorth   = "sn"
    switzerlandwest    = "sww"
    uaecentral         = "uc"
    uaenorth           = "un"
    uksouth            = "uks"
    ukwest             = "ukw"
    westcentralus      = "wcu"
    westeurope         = "we"
    westindia          = "wi"
    westus             = "wu"
    westus2            = "wu2"
    westus3            = "wu3"
  }
}
