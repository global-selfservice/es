module "redirect" {
  source = "github.com/global-devops-terraform/redirect?ref=v1.3.4"

  cidr_blocks       = module.common.global_lan_cidr
  dns_name          = "kibana"
  domain_name       = local.domain_name
  logging_bucket    = local.logging_bucket
  name              = "redirect-kibana-${local.environment}"
  subnets           = local.public_subnets
  vpc_id            = local.vpc_id
  zone_id           = local.zone_id
  redirect_host     = local.kibana_host
  redirect_port     = local.kibana_port
  redirect_protocol = local.kibana_protocol
}

locals {
  kibana_parts    = split(":", local.kibana_url)
  kibana_protocol = upper(local.kibana_parts[0])
  kibana_port     = local.kibana_parts[2]
  kibana_host     = trimprefix(local.kibana_parts[1], "//")
}
