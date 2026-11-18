# Agent Manager

Current setup uses agent-manager 0.49.0 with Pi as the default CLI.

Install the release matching your operating system and architecture.
Verify its archive against the same release's checksums.txt. Upstream:
https://github.com/wainmann/agent-manager

Run `bash scripts/install_agent_manager.sh` from any directory to link the
Neovim editor wrapper and import `settings.json`. This merges only the explicit
preferences; sessions and unrelated settings remain intact.

Current releases store settings in the OS user config directory's `state.db`
(`~/.config/agent-manager/state.db` on Linux). Change preferences through the UI
or `agent-manager settings`. The old `config.toml` in this repository is a
legacy reference, not installed: tool/status rules now ship in the binary.
Pi integration is injected automatically when the manager launches Pi; no
manual global Pi extension or MCP setup is needed.

Start with `agent-manager`. `n` creates a Pi session; Enter focuses it;
Ctrl+Q or Ctrl+backslash returns to the list. Ctrl+N opens its directory in Neovim.
Sessions persist on the private tmux server: `tmux -L agentmgr ls`.
