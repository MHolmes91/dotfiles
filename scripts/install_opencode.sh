#!/bin/bash

ln -sf "$(pwd)/ai/AGENTS.md" "$HOME/AGENTS.md"
ln -sf "$(pwd)/.config/opencode" "$HOME/.config"

echo "AGENTS.md and OpenCode configuration symlinked successfully"
