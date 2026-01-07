return {
  {
    "nvim-neotest/neotest",
    -- See if we can change this after https://github.com/nvim-neotest/neotest/issues/531
    -- commit = "52fca6717ef972113ddd6ca223e30ad0abb2800c",
    lazy = true,
    dependencies = {
      "haydenmeade/neotest-jest",
      "arthur944/neotest-bun",
    },
    opts = function(_, opts)
      opts.discovery = {
        enabled = true,
      }
      opts.summary = { expand_errors = true, follow = true }
      table.insert(
        opts.adapters,
        require("neotest-bun")({
          -- Only act as the adapter if a bun-specific file exists
          cwd = function(path)
            return require("neotest-bun.util").root(path)
          end,
          symbol_queries = true, -- Helps with discovery
        })
      )
      table.insert(
        opts.adapters,
        require("neotest-jest")({
          -- jestCommand = "node_modules/.bin/jest",
          -- or as a function for dynamic resolution:
          jestCommand = function(file)
            return require("neotest-jest.jest-util").getJestCommand(file)
          end,
          root = function(path)
            local util = require("neotest-jest.util")
            return util.root(path) -- looks for jest.config, package.json, etc.
          end,
          env = { CI = true },
          -- cwd = function()
          --   return vim.fn.getcwd()
          -- end,
          cwd = function(file)
            -- Find the directory containing node_modules that has jest
            local util = require("neotest-jest.util")
            local cwd = file
            while cwd ~= "/" do
              local jest_binary = util.path.join(cwd, "node_modules", ".bin", "jest")
              if util.path.exists(jest_binary) then
                return cwd
              end
              cwd = util.path.dirname(cwd)
            end
            return vim.fn.getcwd()
          end,
          jest_test_discovery = true,
        })
      )
    end,
  },
}
