variable "env" {
  type = string
}

variable "location" {
  type    = string
  default = "Canada Central"
}

variable "location_short" {
  type    = string
  default = "cc"
}

variable "owner" {
  type = string
  default = "Matias Uhart"
}

variable "admin_group_ad_ids_1" {
  type = string
}

variable "subscription_id" {
  type = string
}

variable "aks_ad_tenant_id" {
  type = string
}

variable "bastion_azureuser_ssh_key" {
  type = string
}

locals {
  global_common_tags         = {}
  subscription_common_tags   = {}
  environment_common_tags    = {}
  resource_group_common_tags = {}
  role_common_tags           = {
    role_name = "snm-test"
  }
}
