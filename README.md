# dotfiles

Mark's config. macOS + Omarchy (Hyprland on Linux).

## Layout

- `.config/` — XDG configs (nvim, ghostty, waybar, hypr, gitui, opencode, omarchy)
- `claude/themes/` — Claude Code custom themes (port manually, see below)
- `scripts/` — install scripts per tool
- `zsh/` — prompt + zsh extras
- `ai/` — agent rules (`AGENTS.md`)

## Theming

Active theme: **Everforest Light Soft** (`sainnhe/everforest`).

Touchpoints:
- Neovim — `.config/nvim/lua/plugins/colorscheme.lua`
- Ghostty — `.config/ghostty/config` (`theme = Everforest Light Soft`)
- opencode — `.config/opencode/tui.json` (`"theme": "everforest"`)
- gitui — `.config/gitui/theme.ron`
- Claude Code — see below

## Claude Code theme port

Custom Claude Code themes live in `claude/themes/`. Symlink into `~/.claude/themes/` then activate via settings.

```bash
mkdir -p ~/.claude/themes
ln -sf "$PWD/claude/themes/everforest-light-soft.json" ~/.claude/themes/everforest-light-soft.json
```

Activate in `~/.claude/settings.json`:

```json
"theme": "custom:everforest-light-soft"
```

Or pick via `/theme` inside Claude Code. Edits in repo apply live (symlink).

To add a new theme: drop `<name>.json` in `claude/themes/`, re-run the symlink line with the new file.

## Install

Per-tool scripts in `scripts/`. Run as needed:

```bash
scripts/install_ghostty.sh
scripts/install_neovim.sh
scripts/install_omarchy.sh
scripts/install_opencode.sh
scripts/install_termux.sh
scripts/install_zim.sh
```
