# Creación del Registro de Contenedores de Azure
resource "azurerm_container_registry" "acr" {
  name                = "casopractico2acr12345"  # Cambia este nombre a uno único
  resource_group_name = azurerm_resource_group.rg.name  # Nombre del grupo de recursos
  location            = azurerm_resource_group.rg.location  # Ubicación del Registro de Contenedores
  sku                 = "Basic"                       # SKU del Registro de Contenedores
  admin_enabled       = true                          # Habilitar acceso de administrador
  tags                = var.tags                      # Etiquetas aplicadas al Registro de Contenedores
}

