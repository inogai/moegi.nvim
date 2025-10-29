---@class moegi.ConfigComplete
---@field flavour_light string  the flavour to use in light mode
---@field flavour_dark string   the flavour to use in dark mode
---@field constant_gui string   the gui opts for constant variable
---@field string_gui string     the gui opts for string & char literals
---@field keyword_gui string    the gui opts for keywords and numeric / boolean literals
---@field diagnostic_underline_gui string the gui opts for diagnostic underlines

---@class moegi.Config
---@field flavour_light string  the flavour to use in light mode
---@field flavour_dark string   the flavour to use in dark mode
---@field constant_gui? string   the gui opts for constant variable
---@field string_gui? string     the gui opts for string & char literals
---@field keyword_gui? string    the gui opts for keywords and numeric / boolean literals
---@field diagnostic_underline_gui? string the gui opts for diagnostic underlines

local M = {}

---@type moegi.ConfigComplete
M.default_config = {
  flavour_light = "light",
  flavour_dark = "dark",
  constant_gui = "bold",
  string_gui = "italic",
  keyword_gui = "bold italic",
  diagnostic_underline_gui = "undercurl",
}

return M
