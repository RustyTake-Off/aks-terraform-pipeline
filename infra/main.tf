####################################################################################################
# Terraform configuration
terraform {

  ##################################################
  # Required Terraform version
  required_version = ">= 1.3.0, < 2.0.0"

  ##################################################
  # Required providers
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

####################################################################################################
# Provider configuration
provider "azurerm" {

  ##################################################
  # Backend for storing state files
  /*backend "azurerm" {
    resource_group_name  = ""
    storage_account_name = ""
    container_name       = ""
    key                  = ""
  }*/

  features {}
}
