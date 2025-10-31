local M = {}

local default_config = {}

---@type moegi.ConfigComplete
M._config = require("moegi.config").default_config

---@param config? moegi.Config
function M.setup(config)
  M._config = vim.tbl_deep_extend("force", default_config, M._config)
  package.loaded["moegi.theme"] = nil -- requires reload to make new config work

  require("moegi.theme")
end

function M.get_flavour()
  if vim.opt.background:get() == "light" then
    return M._config.flavour_light
  end

  return M._config.flavour_dark
end

function M.get_palette()
  if M.get_flavour() == "light" then
    return require("moegi.flavour.light")
  end
  return require("moegi.flavour.dark")
end

function M._init()
  return require("moegi.utils"), M.get_palette(), M._config
end

return M
