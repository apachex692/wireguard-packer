# Author: InferenceFailed Developers
# Created on: 06/01/2024
build {
  name    = "wireguard-ubuntu-build"
  sources = var.build_sources

  provisioner "shell" {
    environment_vars = [
      "GITHUB_PAT=${var.github_pat}"
    ]
    execute_command = "echo 'packer' | sudo -S sh -c '{{ .Vars }} {{ .Path }}'"

    script = var.provisioner_script_path
  }
}
