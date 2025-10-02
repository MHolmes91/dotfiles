return {
  {
    "nvim-neotest/neotest",
    -- See if we can change this after https://github.com/nvim-neotest/neotest/issues/531
    commit = "52fca6717ef972113ddd6ca223e30ad0abb2800c",
    lazy = true,
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
