data "terraform_remote_state" "vpc" {
  backend = "remote"
  config  = {
    hostname     = "tfe.apdev.com"
    organization = "amorepacific_DevOps"
    workspaces   = {
      name = "vpc"
    }
  }
}
data "terraform_remote_state" "ecs" {
  backend = "remote"
  config  = {
    hostname     = "tfe.apdev.com"
    organization = "amorepacific_DevOps"
    workspaces   = {
      name = "ecs"
    }
  }
}