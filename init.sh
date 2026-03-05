#!/usr/bin/env bash

set -euo pipefail

main() {
  echo "Installing mise..."
  curl https://mise.run | sh

  export PATH="$HOME/.local/bin:$PATH"
  eval "$(mise activate bash)"

  echo "Applying dotfiles with chezmoi"
  mise exec chezmoi -- chezmoi init --apply https://github.com/disintegrator/dotfiles.git

  mise exec node pnpm -- mise install

  setup_ubuntu

  echo "Bootstrap complete."
}

setup_ubuntu() {
  if [[ -f /etc/os-release ]]; then
    # shellcheck disable=SC1091
    source /etc/os-release
    if [[ "${ID:-}" == "ubuntu" || "${ID_LIKE:-}" == *"ubuntu"* ]]; then
      echo "Ubuntu detected. Installing zsh and git..."
      sudo apt-get update
      sudo apt-get install -y zsh git

      ZSH_PATH="$(command -v zsh)"
      CURRENT_SHELL="$(getent passwd "$USER" | cut -d: -f7)"
      if [[ "$CURRENT_SHELL" != "$ZSH_PATH" ]]; then
        echo "Setting zsh as default shell for $USER..."
        sudo chsh -s "$ZSH_PATH" "$USER"
      fi
    fi

    echo "Installing Docker..."
    sudo apt remove $(dpkg --get-selections docker.io docker-compose docker-compose-v2 docker-doc podman-docker containerd runc | cut -f1)
    sudo apt install ca-certificates curl
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc
    sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")
Components: stable
Signed-By: /etc/apt/keyrings/docker.asc
EOF
    sudo apt update
    sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

  fi
}

main