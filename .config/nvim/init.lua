-- Make mise shims available even when launched outside an activated shell.
local mise = vim.fn.exepath("mise")
if mise == "" then
  mise = vim.fn.expand("~/.local/bin/mise")
end
local asdf_data = vim.env.ASDF_DATA_DIR or vim.fn.expand("~/.asdf")
local has_asdf = vim.fn.executable("asdf") == 1 or vim.fn.isdirectory(asdf_data .. "/shims") == 1
if not has_asdf and vim.fn.executable(mise) == 1 then
  local data = vim.env.MISE_DATA_DIR or ((vim.env.XDG_DATA_HOME or vim.fn.expand("~/.local/share")) .. "/mise")
  vim.env.PATH = vim.fs.dirname(mise) .. ":" .. data .. "/shims:" .. vim.env.PATH
end

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
