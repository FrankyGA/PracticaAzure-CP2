# Creación del grupo de recursos en Azure
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name  # Nombre del grupo de recursos
  location = var.location             # Ubicación del grupo de recursos
  tags     = var.tags                 # Etiquetas aplicadas al grupo de recursos
}

