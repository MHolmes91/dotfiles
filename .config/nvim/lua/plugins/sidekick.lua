local asdf = require("config.asdf")

return {
  "folke/sidekick.nvim",
  opts = function(_, opts)
    asdf.export_version("nodejs")
    return opts
  end,
  keys = function()
    local default_sidekick = vim.env.SIDEKICK_DEFAULT_NAME
    if not default_sidekick or default_sidekick == "" then
      default_sidekick = "codex"
    end

    return {
      {
        "<tab>",
        function()
          -- if there is a next edit, jump to it, otherwise apply it if any
          if not require("sidekick").nes_jump_or_apply() then
            return "<Tab>" -- fallback to normal tab
          end
        end,
        expr = true,
        desc = "Goto/Apply Next Edit Suggestion",
      },
      {
        "<leader>aa",
        function()
          require("sidekick.cli").toggle({ name = default_sidekick, focus = true })
        end,
        desc = "Sidekick Toggle",
      },
      {
        "<leader>af",
        function()
          require("sidekick.cli").focus()
        end,
        desc = "Sidekick Focus",
      },
      {
        "<leader>ac",
        function()
          require("sidekick.cli").toggle({ name = "claude", focus = true })
        end,
        desc = "Sidekick Claude Toggle *Default*",
      },
      {
        "<leader>ax",
        function()
          require("sidekick.cli").toggle({ name = "codex", focus = true })
        end,
        desc = "Sidekick Codex Toggle",
      },
    }
  end,
}
