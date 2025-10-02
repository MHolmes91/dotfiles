return {
  "zbirenbaum/copilot.lua",
  opts = function(_, opts)
    vim.env.ASDF_NODEJS_VERSION = "22.14.0"
    opts.panel = { enabled = true }
    return opts
  end,
}
