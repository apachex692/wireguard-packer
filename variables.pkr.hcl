# Author: InferenceFailed Developers
# Created on: 29/12/2023
#
# General
variable "build_sources" {
  type = list(string)
  default = [
    "source.amazon-ebs.wireguard_ubuntu",
    #"source.azure-arm.wireguard_ubuntu"
  ]
}

variable "image_name" {
  type    = string
  default = "temp"
}

variable "provisioner_script_path" {
  type    = string
  default = "scripts/user-data.sh"
}

# General: AWS
variable "aws_region" {
  type    = string
  default = "ap-south-1"
}

variable "aws_copy_to_regions" {
  type    = list(string)
  default = []
}

# Secrets: GitHub
variable "github_pat" {
  type      = string
  sensitive = true
}

# Secrets: Azure
variable "azure_client_id" {
  type      = string
  sensitive = true
  default   = ""
}

variable "azure_client_secret" {
  type      = string
  sensitive = true
  default   = ""
}

variable "azure_subscription_id" {
  type      = string
  sensitive = true
  default   = ""
}

variable "azure_tenant_id" {
  type      = string
  sensitive = true
  default   = ""
}
