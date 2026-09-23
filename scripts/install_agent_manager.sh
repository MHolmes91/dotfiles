#!/bin/bash

mkdir -p "$HOME/bin" "$HOME/Library/Application Support/agent-manager"
ln -sf "$(pwd)/bin/nvim-cd" "$HOME/bin/nvim-cd"
ln -sf "$(pwd)/.config/agent-manager/config.toml" "$HOME/Library/Application Support/agent-manager/config.toml"

echo "Agent Manager configuration symlinked successfully"
