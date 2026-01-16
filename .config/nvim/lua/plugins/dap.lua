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

        table.insert(dap.configurations[lang], {
          type = "pwa-chrome",
          request = "launch",
          name = "Chrome - Launch",
          url = "http://localhost:3000",
          webRoot = "${workspaceFolder}",
          protocol = "inspector",
          port = 9222,
          sourceMaps = true,
          userDataDir = vim.fn.expand("~") .. "/.config/dap/pwa-chrome/user-data-dir",
          skipFiles = { "<node_internals>/**", "node_modules/**" },
        })

        table.insert(dap.configurations[lang], {
          type = "pwa-chrome",
          request = "attach",
          name = "Chrome - Attach",
          protocol = "inspector",
          port = 9222,
          url = "http://localhost:3000",
          webRoot = "${workspaceFolder}",
          sourceMaps = true,
          skipFiles = { "<node_internals>/**", "node_modules/**" },
        })
      end

      return opts
    end,
  },
}
