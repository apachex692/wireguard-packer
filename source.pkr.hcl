# Author: InferenceFailed Developers
# Created on: 07/01/2023
source "amazon-ebs" "wireguard_ubuntu" {
  ami_name      = var.image_name
  instance_type = "t2.micro"
  region        = var.aws_region
  ami_regions   = var.aws_copy_to_regions
  source_ami    = data.amazon-ami.ubuntu.id
  ssh_username  = "ubuntu"
}

source "azure-arm" "wireguard_ubuntu" {
  azure_tags = {
    dept = "Engineering"
    task = "Image Deployment"
  }

  client_id       = var.azure_client_id
  client_secret   = var.azure_client_secret
  subscription_id = var.azure_subscription_id
  tenant_id       = var.azure_tenant_id

  image_offer                       = "0001-com-ubuntu-server-jammy"
  image_publisher                   = "Canonical"
  image_sku                         = "22_04-lts-gen2"
  location                          = "Central India"
  managed_image_name                = var.image_name
  managed_image_resource_group_name = "wireguard-ubuntu"
  os_type                           = "Linux"
  vm_size                           = "Standard_DS2_v2"
}
