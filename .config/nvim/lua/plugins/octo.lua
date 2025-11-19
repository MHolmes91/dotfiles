return {
  "pwntester/octo.nvim",
  opts = {
    picker = "fzf-lua",
  },
  keys = {
    { "<leader>Gr", "<cmd>Octo repo list<CR>", desc = "List Repos (Octo)" },
    { "<leader>Gs", "<cmd>Octo search<CR>", desc = "Search (Octo)" },

    { "<leader>Gil", "<cmd>Octo issue list<CR>", desc = "List Issues (Octo)" },
    { "<leader>Gis", "<cmd>Octo issue search<CR>", desc = "Search Issues (Octo)" },
    { "<leader>Gii", "", desc = "+issue (Octo)", ft = "octo" },

    { "<leader>Gpl", "<cmd>Octo pr list<CR>", desc = "List PRs (Octo)" },
    { "<leader>Gps", "<cmd>Octo pr search<CR>", desc = "Search PRs (Octo)" },
    { "<leader>Gpf", "<cmd>Octo pr<CR>", desc = "Find branch PR (Octo)" },
    { "<leader>Gpc", "<cmd>Octo pr create<CR>", desc = "Create branch PR (Octo)" },
    { "<leader>Gpp", "", desc = "+pr (Octo)", ft = "octo" },

    -- These are only available in Octo
    { "<leader>Gpr", "", desc = "+rebase (Octo)", ft = "octo" },
    { "<leader>Gps", "", desc = "+squash (Octo)", ft = "octo" },

    { "<leader>Ga", "", desc = "+assignee (Octo)", ft = "octo" },
    { "<leader>Gc", "", desc = "+comment/code (Octo)", ft = "octo" },
    { "<leader>Gl", "", desc = "+label (Octo)", ft = "octo" },
    { "<leader>Gr", "", desc = "+react (Octo)", ft = "octo" },
    { "<leader>Gv", "", desc = "+review (Octo)", ft = "octo" },
    { "<leader>Gg", "", desc = "+goto_issue (Octo)", ft = "octo" },
    { "@", "@<C-x><C-o>", mode = "i", ft = "octo", silent = true },
    { "#", "#<C-x><C-o>", mode = "i", ft = "octo", silent = true },
  },
}
