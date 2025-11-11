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
        "<leader>ad",
        function()
          require("sidekick.cli").send({ msg = "{diagnostics}" })
        end,
        desc = "Send Diagnostics",
      },
      {
        "<leader>ap",
        function()
          require("sidekick.cli").send({ msg = "{file}" })
        end,
        desc = "Send Path",
      },
      {
        "<leader>al",
        function()
          require("sidekick.cli").send({ msg = "{line}" })
        end,
        desc = "Send Line",
      },
      {
        "<leader>ab",
        function()
          require("sidekick.cli").send({ msg = "{buffers}" })
        end,
        desc = "Send Buffers",
      },
      {
        "<leader>af",
        function()
          require("sidekick.cli").focus()
        end,
        desc = "Sidekick Focus",
      },
    }
  end,
}
