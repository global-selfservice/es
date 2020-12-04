provider "vault" {}

data "vault_generic_secret" "es" {
  path = "secret/devops/elastic/deployment/selfservice-${local.environment}"
}

locals {
  elasticsearch_password = data.vault_generic_secret.es.data["password"]
  elasticsearch_url      = data.vault_generic_secret.es.data["elasticsearch"]
  elasticsearch_username = data.vault_generic_secret.es.data["username"]
  kibana_url             = data.vault_generic_secret.es.data["kibana"]
}
