local wk = require("which-key")

local function quickfix()
  vim.lsp.buf.code_action({
    filter = function(a)
      return a.isPreferred
    end,
    apply = true,
  })
end

wk.add({
  { "<leader>cq", quickfix, desc = "Quick Fix", mode = "n", icon = "󰁨" },
})

return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      copilot = {},
    },
  },
}
