terraform {
  backend "remote" {
    hostname     = "tfe.apdev.com"
    organization = "amorepacific_DevOps"
    workspaces {
      name       = "aws-cicd-pipeline"
    }
  }
}