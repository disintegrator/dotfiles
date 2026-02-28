#!/usr/bin/env bash

set -euo pipefail

echo "Installing mise..."
curl https://mise.run | sh

echo 'eval "$(mise activate bash)"'

echo "Applying dotfiles with chezmoi"
mise exec chezmoi -- chezmoi init --apply https://github.com/disintegrator/dotfiles.git

mise install

echo "Bootstrap complete."
