# Generación de una clave privada TLS
resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"  # Algoritmo de cifrado
  rsa_bits  = 2048   # Tamaño de la clave en bits
}

# Creación de la Máquina Virtual Linux en Azure
resource "azurerm_linux_virtual_machine" "vm" {
  name                = "casopractico2-vm"            # Nombre de la Máquina Virtual
  resource_group_name = azurerm_resource_group.rg.name  # Nombre del grupo de recursos
  location            = azurerm_resource_group.rg.location  # Ubicación de la Máquina Virtual
  size                = var.vm_size                   # Tamaño de la Máquina Virtual
  tags                = var.tags                      # Etiquetas aplicadas a la Máquina Virtual

  # Configuración del usuario administrador y clave SSH
  admin_username = var.admin_username
  admin_ssh_key {
    username   = var.admin_username                   # Nombre de usuario administrador
    public_key = tls_private_key.ssh_key.public_key_openssh  # Clave pública SSH
  }

  # IDs de las interfaces de red
  network_interface_ids = [azurerm_network_interface.nic.id]

  # Configuración del disco del sistema operativo
  os_disk {
    caching              = "ReadWrite"                # Caché del disco
    storage_account_type = "Standard_LRS"             # Tipo de cuenta de almacenamiento
    disk_size_gb         = var.vm_os_disk_size_gb     # Tamaño del disco en GB
  }

  # Referencia a la imagen del sistema operativo
  source_image_reference {
    publisher = "Canonical"                           # Publicador de la imagen
    offer     = "UbuntuServer"                        # Oferta de la imagen
    sku       = "18.04-LTS"                           # SKU de la imagen
    version   = "latest"                              # Versión de la imagen
  }

  # Habilitar identidad administrada asignada por el sistema
  identity {
    type = "SystemAssigned"                           # Tipo de identidad
  }
}









