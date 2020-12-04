provider "elasticsearch" {
  url      = local.elasticsearch_url
  username = local.elasticsearch_username
  password = local.elasticsearch_password
  insecure = true
}

terraform {
  backend "s3" {
    bucket         = "global-self-service-dev-terraform-state"
    key            = "es.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
  }

  required_providers {
    elasticsearch = {
      source  = "phillbaker/elasticsearch"
      version = "1.4.1"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
}
