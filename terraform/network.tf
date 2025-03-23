# Creación de la Red Virtual en Azure
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name                # Nombre de la Red Virtual
  address_space       = ["10.0.0.0/16"]              # Espacio de direcciones de la Red Virtual
  location            = azurerm_resource_group.rg.location  # Ubicación de la Red Virtual
  resource_group_name = azurerm_resource_group.rg.name      # Nombre del grupo de recursos
  tags                = var.tags                     # Etiquetas aplicadas a la Red Virtual
}

# Creación de la Subred en la Red Virtual
resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name              # Nombre de la Subred
  resource_group_name  = azurerm_resource_group.rg.name  # Nombre del grupo de recursos
  virtual_network_name = azurerm_virtual_network.vnet.name  # Nombre de la Red Virtual
  address_prefixes     = ["10.0.1.0/24"]              # Prefijos de direcciones de la Subred
}

# Creación del Grupo de Seguridad de Red
resource "azurerm_network_security_group" "nsg" {
  name                = var.nsg_name                  # Nombre del Grupo de Seguridad de Red
  location            = azurerm_resource_group.rg.location  # Ubicación del Grupo de Seguridad de Red
  resource_group_name = azurerm_resource_group.rg.name      # Nombre del grupo de recursos
  tags                = var.tags                      # Etiquetas aplicadas al Grupo de Seguridad de Red

  # Regla de seguridad para permitir SSH
  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  # Regla de seguridad para permitir HTTP
  security_rule {
    name                       = "HTTP"
    priority                   = 1002
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# Creación de la IP Pública
resource "azurerm_public_ip" "public_ip" {
  name                = var.public_ip_name            # Nombre de la IP Pública
  location            = azurerm_resource_group.rg.location  # Ubicación de la IP Pública
  resource_group_name = azurerm_resource_group.rg.name      # Nombre del grupo de recursos
  allocation_method   = "Static"                     # Método de asignación de la IP Pública
  sku                 = "Standard"                    # SKU de la IP Pública
	tags                = var.tags                      # Etiquetas aplicadas a la IP Pública
}

# Creación de la Interfaz de Red
resource "azurerm_network_interface" "nic" {
  name                = var.nic_name                  # Nombre de la Interfaz de Red
  location            = azurerm_resource_group.rg.location  # Ubicación de la Interfaz de Red
  resource_group_name = azurerm_resource_group.rg.name      # Nombre del grupo de recursos
  tags                = var.tags                      # Etiquetas aplicadas a la Interfaz de Red

  # Configuración de la IP de la Interfaz de Red
  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id  # ID de la Subred
    private_ip_address_allocation = "Dynamic"                 # Asignación de IP privada
    public_ip_address_id          = azurerm_public_ip.public_ip.id  # ID de la IP Pública
  }
}






