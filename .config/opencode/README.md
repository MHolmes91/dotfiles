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
