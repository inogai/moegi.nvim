local template = require("moegi.lush_template")

local M = {}

---@param config? moegi.Config
function M.setup(config)
  vim.g.moegi_config = config or {}
  package.loaded["moegi.lush_template"] = nil -- requires reload to make new config work
  require("lush")(require("moegi.lush_template"))
  vim.g.moegi_config = nil
end

return M
