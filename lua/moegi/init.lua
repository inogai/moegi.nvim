local M = {}

---@param config? moegi.Config
function M.setup(config)
  vim.g.moegi_config = config or {}
  package.loaded["moegi.lush_template"] = nil -- requires reload to make new config work
  require("lush")(require("moegi.lush_template"))
end

return M
