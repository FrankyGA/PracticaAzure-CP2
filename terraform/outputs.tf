# Salida del nombre del grupo de recursos
output "resource_group_name" {
  value = azurerm_resource_group.rg.name  # Nombre del grupo de recursos
}

# Salida del servidor de inicio de sesión del ACR
output "acr_login_server" {
  value = azurerm_container_registry.acr.login_server  # Servidor de inicio de sesión del ACR
}

# Salida del nombre del clúster de AKS
output "aks_cluster_name" {
  value = azurerm_kubernetes_cluster.aks.name  # Nombre del clúster de AKS
}

# Salida de la IP pública de la VM
output "vm_public_ip" {
  value = azurerm_public_ip.public_ip.ip_address  # Dirección IP pública de la VM
}

output "ssh_private_key" {
  value     = tls_private_key.ssh_key.private_key_pem
  sensitive = true
}

