local wk = require("which-key")
wk.add({
  -- Basic Neovim
  { "<leader>wt", group = "Terminal", icon = "" },
  { "<leader>wtv", ":vsplit | terminal<CR>", desc = "Vertical Terminal", mode = "n" },
  { "<leader>wth", ":split | terminal<CR>", desc = "Horizontal Terminal", mode = "n" },

  -- Octo
  { "<leader>G", group = "GitHub", icon = "" },
  { "<leader>Gi", group = "+issue", icon = "" },
  { "<leader>Gp", group = "+pr", icon = "" },
})

return {}
