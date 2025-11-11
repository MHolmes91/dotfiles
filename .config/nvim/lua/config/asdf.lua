local M = {}
local cache = {}

local function systemlist(args)
  local lines = vim.fn.systemlist(args)
  if vim.v.shell_error ~= 0 or not lines then
    return nil
  end
  return lines
end

local function trim_versions(lines)
  if not lines then
    return nil
  end

  for i = #lines, 1, -1 do
    local version = vim.trim(lines[i] or "")
    if version ~= "" and version ~= "system" then
      return version
    end
  end
end

function M.latest_installed(tool)
  if cache[tool] ~= nil then
    return cache[tool]
  end

  local version = trim_versions(systemlist({ "asdf", "list", tool }))
  if not version then
    local fallback = systemlist({ "asdf", "latest", tool })
    if fallback and fallback[1] then
      version = vim.trim(fallback[1])
    end
  end

  cache[tool] = version
  return version
end

function M.export_latest(tool, env_var)
  local version = M.latest_installed(tool)
  local target_env = env_var or "ASDF_NODEJS_VERSION"
  if version and target_env then
    vim.env[target_env] = version
  end
  return version
end

return M
