# Author: InferenceFailed Developers
# Created on: 11/01/2023
data "amazon-ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filters = {
    name                = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"
    architecture        = "x86_64"
    virtualization-type = "hvm"
    root-device-type    = "ebs"
  }
}
