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

---@class moegi.hl.Link
---@field link string

---@class moegi.hl.Generic
---@field [1]? string
---@field fg? string
---@field bg? string
---@field sp? string
---@field gui? string[]

---@alias moegi.hl moegi.hl.Link|moegi.hl.Generic

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
highlights_add("moegi.theme.semantic_tokens")

for integration, enabled in pairs(O.integrations or {}) do
  if enabled then
    highlights_add("moegi.theme.integrations." .. integration)
  end
end

--- Resolve a highlight group by name
---@param name string
---@return moegi.hl.Generic
local function resolve_hl(name)
  local hl = highlights[name]

  if hl.link then
    return resolve_hl(hl.link)
  end

  return hl
end

---@param hl moegi.hl
local function to_nvim_hl(hl)
  local nvim_hl = {}

  if hl.link then
    nvim_hl.link = hl.link
    return nvim_hl
  end

  if hl[1] then
    local base = resolve_hl(hl[1])
    hl = vim.deepcopy(base)
  end

  nvim_hl.fg = hl.fg
  nvim_hl.bg = hl.bg
  nvim_hl.sp = hl.sp

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
