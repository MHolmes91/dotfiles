return {
  "zbirenbaum/copilot.lua",
  opts = function(_, opts)
    vim.env.ASDF_NODEJS_VERSION = "22.20.0"
    opts.panel = { enabled = true }
    return opts
  end,
}
