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
  common_tags = {
    owner              = "Jared Holgate"
    se-region          = var.aws_region
    purpose            = "Setup multiple agents and workspaces for Terraform Enterprise / Cloud Scale testing"
    ttl                = "7d"
    terraform          = "true"  
    hc-internet-facing = "false" 
  }
}

provider "aws" {
  region = var.region

  default_tags {
    tags = local.common_tags
  }
}

provider "tfe" {
    hostname = var.tfe_hostname
}