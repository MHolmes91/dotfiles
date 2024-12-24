local wk = require("which-key")
wk.add({
  { "<leader>wt", group = "Terminal", icon = '"' },
  { "<leader>wtv", ":vsplit | terminal<CR>", desc = "Vertical Terminal", mode = "n" },
  { "<leader>wth", ":split | terminal<CR>", desc = "Horizontal Terminal", mode = "n" },
  { "<leader>cq", desc = "Quick Fix", mode = "n" },
})
