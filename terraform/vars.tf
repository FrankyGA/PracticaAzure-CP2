# Definición de variables utilizadas en la configuración de Terraform

# Región de Azure
variable "location" {
  description = "Azure region"
  default     = "West Europe"
}

# Nombre del grupo de recursos
variable "resource_group_name" {
  description = "Name of the resource group"
  default     = "casopractico2-rg"
}

# Tamaño de la máquina virtual
variable "vm_size" {
  description = "Size of the virtual machine"
  default     = "Standard_DS1_v2"
}

# Nombre de usuario administrador para la VM
variable "admin_username" {
  description = "Admin username for the VM"
  default     = "azureuser"
}

# Nombre del Azure Container Registry
variable "acr_name" {
  description = "Name of the Azure Container Registry"
  default     = "casopractico2acr"
}

# Nombre del clúster de AKS
variable "aks_name" {
  description = "Name of the AKS cluster"
  default     = "casopractico2aks"
}

# Nombre de la Red Virtual
variable "vnet_name" {
  description = "Name of the Virtual Network"
  default     = "casopractico2-vnet"
}

# Nombre de la Subred
variable "subnet_name" {
  description = "Name of the Subnet"
  default     = "default"
}

# Nombre del Grupo de Seguridad de Red
variable "nsg_name" {
  description = "Name of the Network Security Group"
  default     = "casopractico2-nsg"
}

# Nombre de la IP Pública
variable "public_ip_name" {
  description = "Name of the Public IP"
  default     = "casopractico2-pip"
}

# Nombre de la Interfaz de Red
variable "nic_name" {
  description = "Name of the Network Interface"
  default     = "casopractico2-nic"
}

# ID de Suscripción de Azure
variable "subscription_id" {
  description = "Azure Subscription ID"
  default     = "4b0af3f9-868a-443f-b556-f02679c12708"
}

# Etiquetas a aplicar a los recursos
variable "tags" {
  description = "Tags to be applied to resources"
  type        = map(string)
  default     = {
    environment = "casopractico2"
    project     = "cloud-automation"
  }
}

# Tamaño del disco del sistema operativo para la VM en GB
variable "vm_os_disk_size_gb" {
  description = "Size of the OS disk for the VM in GB"
  default     = 30
}



