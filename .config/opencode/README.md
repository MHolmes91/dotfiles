# OpenCode Setup Notes

## Environment variables

### Brave Search MCP

Set `BRAVE_API_KEY` in your shell (or your environment manager). The Brave MCP server reads this variable when it starts.

Optional: if you want to force the value for OpenCode only, add an `environment` block under the MCP entry:

```json
{
  "mcp": {
    "brave-search": {
      "type": "local",
      "command": [
        "npx",
        "-y",
        "@brave/brave-search-mcp-server",
        "--transport",
        "stdio"
      ],
      "environment": {
        "BRAVE_API_KEY": "YOUR_BRAVE_API_KEY"
      },
      "enabled": true
    }
  }
}
```

### Context7 MCP

Get your API key from <https://context7.com/dashboard> and set `CONTEXT7_API_KEY` in your shell.

Preferred: use the remote MCP server with headers:

```json
{
  "mcp": {
    "context7": {
      "type": "remote",
      "url": "https://mcp.context7.com/mcp",
      "headers": {
        "CONTEXT7_API_KEY": "YOUR_CONTEXT7_API_KEY"
      },
      "enabled": true
    }
  }
}
```

Optional: if you want to run the MCP server locally, add a `local` entry and pass the key via `environment`:

```json
{
  "mcp": {
    "context7": {
      "type": "local",
      "command": ["npx", "-y", "@upstash/context7-mcp"],
      "environment": {
        "CONTEXT7_API_KEY": "YOUR_CONTEXT7_API_KEY"
      },
      "enabled": true
    }
  }
}
```

## opencode-openai-codex-auth provider setup

1. Make sure the plugin is pinned in `~/.config/opencode/opencode.json` (or project `.opencode.json`). Example:

   ```json
   "plugin": ["opencode-openai-codex-auth@4.2.0"]
   ```

2. The plugin recommends using its full config for stable GPT-5.x behavior. If you run into model issues, replace your OpenCode config with the plugin's full config:
   - Source: <https://github.com/numman-ali/opencode-openai-codex-auth/blob/main/config/full-opencode.json>
   - Target: `~/.config/opencode/opencode.json` (or `<project>/.opencode.json`)

3. Authenticate once in a terminal:

   ```bash
   opencode auth login
   ```

   Choose "OpenAI" -> "ChatGPT Plus/Pro (Codex Subscription)".

4. If you have the Codex CLI running, stop it before logging in (both use port 1455).

5. Restart OpenCode and select an OpenAI model (e.g., `openai/gpt-5.2-codex-medium`).

Troubleshooting references:

- Plugin docs: <https://numman-ali.github.io/opencode-openai-codex-auth/>
- README: <https://github.com/numman-ali/opencode-openai-codex-auth>
