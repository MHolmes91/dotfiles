# 💤 LazyVim

Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

## Prerequisites

- Code Nerd Font
  - `brew install --cask font-fira-code-nerd-font`
- Pi AI companion (Node.js managed by mise or your preferred runtime manager)
  - `npm install -g @earendil-works/pi-coding-agent`
  - Run `pi`, then `/login` to authenticate.
  - `<leader>aa` toggles Pi through Sidekick; `<leader>af` focuses it.
  - `<leader>ad`, `<leader>ap`, `<leader>al`, `<leader>ab` send diagnostics, file path, line, or buffers.
  - Optional `SIDEKICK_DEFAULT_NAME` overrides the default companion.
- Finding
  - `brew install fzf ripgrep fd`
- Lazygit
  - `brew install jesseduffield/lazygit/lazygit`
  - [Add config.yml](https://github.com/jesseduffield/lazygit/blob/master/docs/Config.md) to /Users/USER/Library/Application Support/lazygit/config.yml
- Left alt key
  - In iTerm2, Preferences -> Profiles -> Keys -> Left option key acts as: +Meta
