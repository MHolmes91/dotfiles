local wk = require("which-key")

return {
  {
    "NickvanDyke/opencode.nvim",
    dependencies = {
      -- Snacks provides input/picker/terminal plumbing that opencode.nvim uses
      { "folke/snacks.nvim", opts = { input = {}, picker = {}, terminal = {} } },
    },
    config = function()
      -- Basic options – you can customize later
      vim.g.opencode_opts = {
        -- leave empty for defaults; check plugin docs for advanced tuning
      }

      -- Needed so buffers reload when OpenCode edits files
      vim.o.autoread = true

      local opencode = require("opencode")

      local function focus_opencode_window()
        vim.schedule(function()
          for _, win in ipairs(vim.api.nvim_list_wins()) do
            local buf = vim.api.nvim_win_get_buf(win)
            local ft = vim.api.nvim_get_option_value("filetype", { buf = buf })
            if ft == "opencode_terminal" then
              vim.api.nvim_set_current_win(win)
              if vim.api.nvim_get_option_value("buftype", { buf = buf }) == "terminal" then
                vim.cmd("startinsert")
              end
              break
            end
          end
        end)
      end

      local function toggle_opencode_panel()
        opencode.toggle()
        focus_opencode_window()
      end

      local function focus_opencode_panel()
        opencode.show()
        focus_opencode_window()
      end

      -- 🔑 WhichKey-driven bindings
      wk.add({
        {
          "<leader>aoa",
          function()
            opencode.ask("@this: ", { submit = true })
          end,
          mode = { "n", "x" },
          desc = "Ask OpenCode about @this",
          icon = "󰭎",
        },
        {
          "<leader>aos",
          function()
            opencode.select()
          end,
          mode = { "n", "x" },
          desc = "Select OpenCode prompt",
          icon = "󰙨",
        },
        {
          "<leader>aod",
          function()
            opencode.prompt("@diagnostics")
          end,
          desc = "Send diagnostics to OpenCode",
          icon = "󰠠",
        },
        {
          "<leader>aol",
          function()
            opencode.prompt("@this")
          end,
          mode = { "n", "x" },
          desc = "Send line/selection to OpenCode",
          icon = "󰆴",
        },
        {
          "<leader>aop",
          function()
            opencode.prompt("@buffer")
          end,
          desc = "Send file path to OpenCode",
          icon = "󱁿",
        },
        {
          "<leader>aot",
          toggle_opencode_panel,
          mode = { "n", "t" },
          desc = "Toggle OpenCode",
          icon = "󰕮",
        },
        {
          "<leader>aof",
          focus_opencode_panel,
          mode = { "n", "t" },
          desc = "Focus OpenCode",
          icon = "",
        },
      })
    end,
  },
}
