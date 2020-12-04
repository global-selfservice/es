data "terraform_remote_state" "network" {
  backend = "s3"

  workspace = terraform.workspace

  config = {
    bucket         = var.production_account ? "global-self-service-terraform-state" : "global-self-service-dev-terraform-state"
    key            = "base.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
  }
}

locals {
  domain_name    = data.terraform_remote_state.network.outputs.domain_name
  environment    = data.terraform_remote_state.network.outputs.environment
  logging_bucket = data.terraform_remote_state.network.outputs.bucket_name
  public_subnets = data.terraform_remote_state.network.outputs.public_subnets
  vpc_id         = data.terraform_remote_state.network.outputs.vpc_id
  zone_id        = data.terraform_remote_state.network.outputs.zone_id
}
