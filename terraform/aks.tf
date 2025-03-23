# Creación del Clúster de Kubernetes en Azure
resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_name                  # Nombre del clúster de AKS
  location            = azurerm_resource_group.rg.location  # Ubicación del clúster de AKS
  resource_group_name = azurerm_resource_group.rg.name      # Nombre del grupo de recursos
  dns_prefix          = "casopractico2"               # Prefijo DNS para el clúster
  tags                = var.tags                      # Etiquetas aplicadas al clúster de AKS

  # Configuración del grupo de nodos predeterminado
  default_node_pool {
    name       = "default"                            # Nombre del grupo de nodos
    node_count = 1                                    # Número de nodos en el grupo
    vm_size    = "Standard_DS2_v2"                    # Tamaño de las máquinas virtuales en el grupo de nodos
  }

  # Identidad asignada por el sistema
  identity {
    type = "SystemAssigned"                           # Tipo de identidad
  }
}

# Asignación de rol para permitir que el clúster de AKS extraiga imágenes del ACR
resource "azurerm_role_assignment" "acr_pull" {
  principal_id        = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id  # ID del principal (identidad) del kubelet
  role_definition_name = "AcrPull"                        # Nombre de la definición del rol
  scope               = azurerm_container_registry.acr.id  # Alcance de la asignación de rol
}

