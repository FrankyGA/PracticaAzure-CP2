# Configuración del proveedor de Azure con ID de suscripción
provider "azurerm" {
  features {}
  subscription_id = var.subscription_id  # ID de Suscripción de Azure
}

