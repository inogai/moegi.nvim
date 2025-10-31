---@class moegi.IntegrationConfig
---@field render_markdown? boolean
---@field ufo? boolean
---@field mini_icons? boolean

---@class moegi.IntegrationConfigComplete
---@field render_markdown boolean
---@field ufo boolean
---@field mini_icons boolean

---@class moegi.ConfigComplete
---@field flavour_light string  the flavour to use in light mode
---@field flavour_dark string   the flavour to use in dark mode
---@field constant_gui string   the gui opts for constant variable
---@field string_gui string     the gui opts for string & char literals
---@field keyword_gui string    the gui opts for keywords and numeric / boolean literals
---@field diagnostic_underline_gui string the gui opts for diagnostic underlines
---@field integrations moegi.IntegrationConfigComplete    table of integrations to enable/disable

---@class moegi.Config
---@field flavour_light? string  the flavour to use in light mode
---@field flavour_dark? string   the flavour to use in dark mode
---@field constant_gui? string   the gui opts for constant variable
---@field string_gui? string     the gui opts for string & char literals
---@field keyword_gui? string    the gui opts for keywords and numeric / boolean literals
---@field diagnostic_underline_gui? string the gui opts for diagnostic underlines
---@field integrations? moegi.IntegrationConfig table of integrations to enable/disable

local M = {}

---@type moegi.ConfigComplete
M.default_config = {
  flavour_light = "light",
  flavour_dark = "dark",
  constant_gui = "bold",
  string_gui = "italic",
  keyword_gui = "bold italic",
  diagnostic_underline_gui = "undercurl",
  integrations = {
    render_markdown = true,
    ufo = true,
    mini_icons = true,
  },
}

return M
