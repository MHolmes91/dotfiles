-- markdownlint-cli2 only discovers configs from cwd upward, so point it at ours explicitly
return {
  "mfussenegger/nvim-lint",
  opts = {
    linters = {
      ["markdownlint-cli2"] = {
        prepend_args = { "--config", vim.fn.stdpath("config") .. "/lint/markdownlint.json" },
      },
    },
  },
}
