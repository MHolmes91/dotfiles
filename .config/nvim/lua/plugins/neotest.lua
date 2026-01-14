return {
  {
    "nvim-neotest/neotest",
    lazy = true,
    dependencies = {
      "haydenmeade/neotest-jest",
      "arthur944/neotest-bun",
    },
    opts = function(_, opts)
      opts.discovery = {
        enabled = false,
      }
      opts.summary = { expand_errors = true, follow = true }

      -- Determine which test runner to use based on environment variable
      -- Defaults to "jest" if not set
      local test_runner = vim.env.NEOTEST_JS_RUNNER or "jest"

      if test_runner == "bun" then
        table.insert(
          opts.adapters,
          require("neotest-bun")({
            cwd = function(path)
              return require("neotest-bun.util").root(path)
            end,
            symbol_queries = true,
          })
        )
      elseif test_runner == "jest" then
        table.insert(
          opts.adapters,
          require("neotest-jest")({
            jestCommand = function(file)
              return require("neotest-jest.jest-util").getJestCommand(file)
            end,
            root = function(path)
              local util = require("neotest-jest.util")
              return util.root(path)
            end,
            env = { CI = true },
            cwd = function(file)
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
      end
    end,
  },
}
