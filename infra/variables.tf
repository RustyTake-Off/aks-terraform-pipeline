variable "Aks" {
  description = "Resources configuration"
  default = {

    Suffix   = "aztfpro03"
    Location = "westeurope"
    RgName   = "rg"

    AksName            = "aks"
    DefaultNodeVMSku   = "Standard_B2s"
    AksWorkerNodeVmSku = "Standard_D2s_v3"
  }
}
