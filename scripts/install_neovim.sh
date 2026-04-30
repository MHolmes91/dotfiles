#!/bin/bash

ln -sf "$(pwd)/.config/nvim" "$HOME/.config"
ln -sf "$(pwd)/.config/gitui" "$HOME/.config"

echo "Neovim configuration symlinked successfully"
