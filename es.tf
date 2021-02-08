module "es" {
  source = "github.com/global-devops-terraform/es?ref=v1.7.1"

  secret_prefix     = "secret/selfservice/envs/${local.environment}/elasticsearch"
  elasticsearch_url = local.elasticsearch_url
  admin_group       = module.common.azure_groups["devops"]
  user_group        = module.common.azure_groups["selfservice"]
}
