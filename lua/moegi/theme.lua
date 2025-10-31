local Moegi = require("moegi")

-- Override globals for easier access within the themes
local globals = { U = U, C = C, O = O }

U = require("moegi.utils")
C = require("moegi").get_palette()
O = Moegi._config

vim.g.colors_name = "moegi"

---@class moegi.Spec
---@field help string
---@field get fun():table<string, vim.api.keyset.highlight>

local highlights = {}

---@class moegi.hl
---@field fg? string
---@field bg? string
---@field sp? string
---@field link? string
---@field gui? string[]

function highlights_add(spec)
  package.loaded[spec] = nil

  local module_ok, module = pcall(require, spec)

  if module_ok and module then
    highlights = vim.tbl_extend("force", highlights, module)
  end
end

highlights_add("moegi.theme.base")
highlights_add("moegi.theme.syntax")
highlights_add("moegi.theme.lsp")
highlights_add("moegi.theme.treesitter")

for integration, enabled in pairs(O.integrations or {}) do
  if enabled then
    highlights_add("moegi.theme.integrations." .. integration)
  end
end

---@type moegi.hl
local function to_nvim_hl(hl)
  local nvim_hl = {}

  nvim_hl.fg = hl.fg
  nvim_hl.bg = hl.bg
  nvim_hl.sp = hl.sp
  nvim_hl.link = hl.link -- TODO: maybe consider a augment-based link?

  for k, v in pairs(hl.gui or {}) do
    nvim_hl[v] = true
  end

  return nvim_hl
end

for name, hl in pairs(highlights) do
  vim.api.nvim_set_hl(0, name, to_nvim_hl(hl))
end

-- restore globals
U = globals.U
C = globals.C
O = globals.O
