local template = require("moegi.lush_template")

local M = {}

---@param config? moegi.Config
function M.setup(config)
  local config_complete = vim.tbl_deep_extend("force", require("moegi.config").default_config, config or {})
  return template.with_config(config_complete)
end

return M
