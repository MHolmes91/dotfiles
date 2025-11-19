return {
  "pwntester/octo.nvim",
  opts = {
    picker = "fzf-lua",
    mappings = {
      runs = {
        expand_step = { lhs = "<localleader>x", desc = "expand workflow step" },
        open_in_browser = { lhs = "<localleader>b", desc = "open workflow run in browser" },
        refresh = { lhs = "<localleader>f", desc = "refresh workflow" },
        rerun = { lhs = "<localleader>ra", desc = "rerun workflow" },
        rerun_failed = { lhs = "<localleader>rf", desc = "rerun failed workflow" },
        cancel = { lhs = "<localleader>c", desc = "cancel workflow" },
        copy_url = { lhs = "<localleader>y", desc = "copy url to system clipboard" },
      },
    },
  },
  keys = {
    -- disable defaults
    { "<leader>gi", false },
    { "<leader>gI", false },
    { "<leader>gp", false },
    { "<leader>gP", false },
    { "<leader>gr", false },
    { "<leader>gS", false },

    -- Top level
    { "<leader>Go", "<cmd>Octo<CR>", desc = "Octo Command" },
    { "<leader>Gr", "<cmd>Octo repo list<CR>", desc = "List Repos" },
    { "<leader>Gs", "<cmd>Octo search<CR>", desc = "Search" },

    -- Issues
    { "<leader>Gil", "<cmd>Octo issue list<CR>", desc = "List Issues" },
    { "<leader>Gis", "<cmd>Octo issue search<CR>", desc = "Search Issues" },

    -- PRs
    { "<leader>Gpl", "<cmd>Octo pr list<CR>", desc = "List PRs" },
    { "<leader>Gps", "<cmd>Octo pr search<CR>", desc = "Search PRs" },
    { "<leader>Gpg", "<cmd>Octo pr<CR>", desc = "Goto branch PR" },
    { "<leader>GpC", "<cmd>Octo pr create<CR>", desc = "Create branch PR" },

    -- Local
    { "<localleader>pD", "<cmd>Octo pr draft<CR>", desc = "Mark PR as draft" },
    { "<localleader>pR", "<cmd>Octo pr ready<CR>", desc = "Mark PR as ready" },
    { "<localleader>pC", "<cmd>Octo pr checks<CR>", desc = "View PR Checks" },
    { "<localleader>pb", "<cmd>Octo pr browser<CR>", desc = "View PR in browser" },
  },
}
