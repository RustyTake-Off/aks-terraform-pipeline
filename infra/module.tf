####################################################################################################
# Creating base resource
resource "azurerm_resource_group" "AksRg" {

  name     = "${var.RgName}${var.Suffix}"
  location = var.Location
}

####################################################################################################
# Aks resource configuration
resource "azurerm_kubernetes_cluster" "Aks" {

  name                = lower("${var.AksName}${var.Suffix}")
  location            = azurerm_resource_group.AksRg.location
  resource_group_name = azurerm_resource_group.AksRg.name

  dns_prefix                       = lower("${var.AksName}${var.Suffix}")
  sku_tier                         = "Free"
  http_application_routing_enabled = true

  default_node_pool {
    name                = "system"
    enable_auto_scaling = true
    min_count           = 1
    max_count           = 2
    vm_size             = var.DefaultNodeVMSku
  }

  identity {
    type = "SystemAssigned"
  }
}

####################################################################################################
# Additional Aks Node Pool resource configuration
resource "azurerm_kubernetes_cluster_node_pool" "Aks" {

  name                  = "worker"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.Aks.id
  vm_size               = var.AksWorkerNodeVmSku
  enable_auto_scaling   = true
  min_count             = 1
  max_count             = 2
}
