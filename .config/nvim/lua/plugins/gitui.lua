return {
  "mason-org/mason.nvim",
  opts = { ensure_installed = { "gitui" } },
  keys = {
    {
      "<leader>gG",
      function()
        -- Launch gitui in cwd, with theme flag (if needed)
        require("snacks").terminal({
          "gitui",
          "-t",
          vim.fn.expand("~/.config/gitui/theme.ron"),
        })
      end,
      desc = "GitUi (cwd)",
    },
    {
      "<leader>gg",
      function()
        require("snacks").terminal({
          "gitui",
          "-t",
          vim.fn.expand("~/.config/gitui/theme.ron"),
        }, { cwd = LazyVim.root.get() })
      end,
      desc = "GitUi (Root)",
    },
  },
}
