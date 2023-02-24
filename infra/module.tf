####################################################################################################
# Creating base resource
resource "azurerm_resource_group" "AksRg" {

  name     = "${var.Aks.RgName}${var.Aks.Suffix}"
  location = var.Aks.Location
}

####################################################################################################
# Aks resource configuration
resource "azurerm_kubernetes_cluster" "Aks" {

  name                = lower("${var.Aks.AksName}${var.Aks.Suffix}")
  location            = azurerm_resource_group.AksRg.location
  resource_group_name = azurerm_resource_group.AksRg.name

  dns_prefix                       = lower("${var.Aks.AksName}${var.Aks.Suffix}")
  sku_tier                         = "Free"
  http_application_routing_enabled = true

  default_node_pool {
    name = "systemnode"

    # node_count          = 1
    enable_auto_scaling = true
    min_count           = 1
    max_count           = 2
    vm_size             = var.Aks.DefaultNodeVMSku
  }

  identity {
    type = "SystemAssigned"
  }
}

####################################################################################################
# Additional Aks Node Pool resource configuration
resource "azurerm_kubernetes_cluster_node_pool" "Aks" {

  name                  = "workernode"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.Aks.id
  vm_size               = var.Aks.AksWorkerNodeVmSku

  # node_count = 1
  enable_auto_scaling = true
  min_count           = 1
  max_count           = 2
}
