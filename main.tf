terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "Kognitiv"

    workspaces {
      prefix = "smn-test-"
    }
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.55"
    }
  }
}

provider "azurerm" {
  skip_provider_registration = true
  features {}
}

data "azurerm_client_config" "current" {}

module "this" {
  source  = "app.terraform.io/Kognitiv/platform-infrastructure-modules/azure//terraform/modules/azure/resource-group"
  version = "0.0.9" # Kognitiv's Terraform Module version to use

  rsg_name     = "smn-test-${var.env}"
  rsg_location = var.location

  rsg_environment_tag = var.env
  rsg_owner_tag       = "Serafin Cepeda"
  rsg_application_tag = "Terraform Cloud"
  rsg_project_tag     = "Terraform Cloud PoC"
}
