terraform {
  required_providers {
    tfe = {
      source = "hashicorp/tfe"
    }
    aws = {
      source = "hashicorp/aws"
    }
  }
}

locals {
  common_tags = merge(var.standard_tags, { region = var.aws_region })
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = local.common_tags
  }
}

provider "tfe" {
  hostname = var.tfe_hostname
}