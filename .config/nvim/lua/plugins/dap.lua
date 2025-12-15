local asdf = require("config.asdf")

return {
  {
    "mfussenegger/nvim-dap",
    optional = true,
    opts = function(_, opts)
      asdf.export_version("nodejs", "ASDF_DAP_NODEJS_VERSION", "24.0.2")
      local dap = require("dap")
      local langs = {
        "typescript",
        "javascript",
        "typescriptreact",
        "javascriptreact",
      }

      for _, lang in ipairs(langs) do
        dap.configurations[lang] = dap.configurations[lang] or {}

        -- Next.js server (attach, when started with --inspect=9230)
        table.insert(dap.configurations[lang], {
          type = "pwa-node",
          request = "attach",
          name = "Next.js server (attach)",
          port = 9230,
          cwd = "${workspaceFolder}",
          sourceMaps = true,
          resolveSourceMapLocations = {
            "${workspaceFolder}/**",
            "!**/node_modules/**",
          },
          skipFiles = { "<node_internals>/**", "node_modules/**" },
        })

        -- Next.js client: Chrome launch
        -- table.insert(dap.configurations[lang], {
        --   type = "pwa-chrome",
        --   request = "launch",
        --   name = "Next.js client (Chrome)",
        --   url = "http://localhost:3000",
        --   webRoot = "${workspaceFolder}",
        --   sourceMaps = true,
        --   protocol = "inspector",
        --   -- make it behave like your normal Chrome
        --   runtimeExecutable = "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome",
        --   userDataDir = false,
        -- })

        -- Next.js client: Chrome attach
        table.insert(dap.configurations[lang], {
          type = "pwa-chrome",
          request = "attach",
          name = "Next.js client (Attach Chrome)",
          port = 9222,
          url = "http://localhost:3000",
          webRoot = "${workspaceFolder}",
          sourceMaps = true,
          protocol = "inspector",
        })
      end

      return opts
    end,
  },
}
