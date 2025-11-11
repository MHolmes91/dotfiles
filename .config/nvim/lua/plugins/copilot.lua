local asdf = require("config.asdf")

return {
  "zbirenbaum/copilot.lua",
  opts = function(_, opts)
    asdf.export_latest("nodejs")
    opts.panel = { enabled = true }
    return opts
  end,
}
