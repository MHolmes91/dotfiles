return {
  "pwntester/octo.nvim",
  opts = {
    picker = "fzf-lua",
    mappings = {
      runs = {
        expand_step = { lhs = "<localleader>x" },
        open_in_browser = { lhs = "<localleader>b" },
        refresh = { lhs = "<localleader>f" },
        rerun = { lhs = "<localleader>ra" },
        rerun_failed = { lhs = "<localleader>rf" },
        cancel = { lhs = "<localleader>c" },
        copy_url = { lhs = "<localleader>y" },
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
  config = function(_, opts)
    require("octo").setup(opts)

    -- WhichKey integration for Octo runs keybindings
    --
    -- Why this is needed:
    -- - Octo sets buffer-local keymaps with descriptions via vim.keymap.set()
    -- - However, Octo applies these keymaps ASYNCHRONOUSLY after buffer creation
    -- - WhichKey doesn't automatically pick up these late-registered descriptions
    -- - This autocmd detects when Octo has finished setup and registers descriptions with WhichKey
    --
    -- How it works:
    -- - BufEnter: Tries to catch early if keymaps are already set (e.g., returning to buffer)
    -- - CursorMoved: Catches after async setup when user first interacts with buffer
    -- - Buffer guard (vim.b.octo_runs_registered): Prevents duplicate registrations
    -- - Detection: Looks for the '<localleader>x' keymap unique to Octo runs buffers
    local wk = require("which-key")

    vim.api.nvim_create_autocmd({ "BufEnter", "CursorMoved" }, {
      pattern = "*",
      callback = function()
        local bufnr = vim.api.nvim_get_current_buf()

        -- Only register once per buffer to avoid duplicate WhichKey entries
        if vim.b[bufnr].octo_runs_registered then
          return
        end

        local keymaps = vim.api.nvim_buf_get_keymap(bufnr, "n")
        local localleader = vim.g.maplocalleader or "\\"

        -- Check if this is an Octo runs buffer by looking for the expand_step keymap
        for _, map in ipairs(keymaps) do
          if map.lhs == localleader .. "x" then
            wk.add({
              { "<localleader>p", group = "PR", icon = "", buffer = bufnr },
              { "<localleader>x", desc = "Expand workflow step", icon = "󰡏", buffer = bufnr },
              { "<localleader>b", desc = "Open workflow in browser", icon = "󰖟", buffer = bufnr },
              { "<localleader>f", desc = "Refresh workflow", icon = "󰑐", buffer = bufnr },
              { "<localleader>r", group = "Rerun", icon = "󰑎", buffer = bufnr },
              { "<localleader>ra", desc = "Rerun workflow", icon = "󰑎", buffer = bufnr },
              { "<localleader>rf", desc = "Rerun failed workflow", icon = "", buffer = bufnr },
              { "<localleader>c", desc = "Cancel workflow", icon = "󰜺", buffer = bufnr },
              { "<localleader>y", desc = "Copy URL", icon = "󰆏", buffer = bufnr },
            })
            vim.b[bufnr].octo_runs_registered = true
            break
          end
        end
      end,
    })
  end,
}
