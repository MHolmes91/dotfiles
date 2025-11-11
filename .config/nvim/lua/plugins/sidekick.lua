local asdf = require("config.asdf")

return {
  "folke/sidekick.nvim",
  opts = function(_, opts)
    asdf.export_latest("nodejs")
    return opts
  end,
  keys = function()
    local default_sidekick = vim.env.SIDEKICK_DEFAULT_NAME
    if not default_sidekick or default_sidekick == "" then
      default_sidekick = "codex"
    end

    return {
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
