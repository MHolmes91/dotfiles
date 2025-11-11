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
    -- Remove leading asterisk that marks currently active version
    version = version:gsub("^%*", "")
    version = vim.trim(version) -- Trim again after removing asterisk
    if version ~= "" and version ~= "system" then
      return version
    end
  end
end

function M.latest_installed(tool)
  if cache[tool] ~= nil then
    return cache[tool]
  end

  -- asdf list returns installed versions only, last line is the latest
  local version = trim_versions(systemlist({ "asdf", "list", tool }))

  cache[tool] = version
  return version
end

function M.export_version(tool, env_var, version)
  local target_version = version or M.latest_installed(tool)
  local target_env = env_var or "ASDF_NODEJS_VERSION"

  if target_version and target_env then
    vim.env[target_env] = target_version
  end
  return target_version
end

return M
