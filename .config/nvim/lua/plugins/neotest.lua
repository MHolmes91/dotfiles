return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "haydenmeade/neotest-jest",
    },
    opts = function(_, opts)
      opts.discovery = {
        enabled = false,
      }
      table.insert(
        opts.adapters,
        require("neotest-jest")({
          jestCommand = "node_modules/.bin/jest",
          env = { CI = true },
          cwd = function()
            return vim.fn.getcwd()
          end,
          jest_test_discovery = false,
        })
      )
    end,
  },
}
