local U, C, c = require("moegi")._init()

local specs = {}

for spec_name, _ in
  vim.iter(c.integrations):filter(function(_, v)
    return v ~= false
  end)
do
  local ok, spec = pcall(require, "moegi.theme.integrations." .. spec_name)
  if ok and spec then
    specs = vim.tbl_extend("force", specs, spec)
  end
end

return specs
