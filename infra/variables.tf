####################################################################################################
# External variables
variable "ARM_TENANT_ID" {
  sensitive = true
}

variable "ARM_SUBSCRIPTION_ID" {
  sensitive = true
}

variable "ARM_CLIENT_ID" {
  sensitive = true
}

variable "ARM_CLIENT_SECRET" {
  sensitive = true
}

####################################################################################################
# General variables
variable "Suffix" {
  default = "aztfpro03"
}

variable "Location" {
  default = "westeurope"
}

variable "RgName" {
  default = "rg"
}

variable "AksName" {
  default = "aks"
}

variable "DefaultNodeVMSku" {
  default = "Standard_B2s"
}

variable "AksWorkerNodeVmSku" {
  default = "Standard_D2s_v3"
}
