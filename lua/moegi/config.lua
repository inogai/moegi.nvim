---@class moegi.ConfigComplete
---@field bold string the override gui opts for bold text
---@field italic string the override gui opts for italic text
---@field undercurl string the override gui opts for undercurl text
---@field krypton string the override gui opts for "krypton" text, by default set to "bold italic"
---@field set_term_colors boolean `true` to set the `vim.g.terminal_color_{i}` variables automatically
---@field weak_colors boolean `true` to use a color palette with weaker contrast

---@class moegi.Config
---@field bold? string the override gui opts for bold text
---@field italic? string the override gui opts for italic text
---@field undercurl? string the override gui opts for undercurl text
---@field krypton? string the override gui opts for "krypton" text, by default set to "bold italic"
---@field set_term_colors? boolean `true` to set the `vim.g.terminal_color_{i}` variables automatically
---@field weak_colors? boolean `true` to use a color palette with weaker contrast

local M = {}

---@type moegi.ConfigComplete
M.default_config = {
  bold = "bold",
  italic = "italic",
  undercurl = "undercurl",
  krypton = "bold italic",
  set_term_colors = true,
  weak_colors = false,
}

return M
