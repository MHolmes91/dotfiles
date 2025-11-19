local wk = require("which-key")
wk.add({
  { "<leader>wt", group = "Terminal", icon = "" },
  { "<leader>G", group = "GitHub", icon = "" },
  { "<leader>Gp", group = "PR", icon = "" },
  { "<leader>Gi", group = "Issue", icon = "" },
  { "<leader>wtv", ":vsplit | terminal<CR>", desc = "Vertical Terminal", mode = "n" },
  { "<leader>wth", ":split | terminal<CR>", desc = "Horizontal Terminal", mode = "n" },
})

return {}
