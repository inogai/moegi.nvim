local M = {}

M.terminal_colors = {
  "black",
  "red",
  "green",
  "yellow",
  "blue",
  "magenta",
  "cyan",
  "white",
  "bright_black",
  "bright_red",
  "bright_green",
  "bright_yellow",
  "bright_blue",
  "bright_magenta",
  "bright_cyan",
  "bright_white",
}

---@param dark? "dark" | "light"
function M.set_term_colors(dark)
  if dark == nil then
    dark = vim.opt.background == "light" and "light" or "dark"
  end

  local p = require("lush_theme.moegi_palette")[dark]

  for i, color in ipairs(M.terminal_colors) do
    vim.g["terminal_color_" .. i - 1] = p.terminal[color]
  end
end

return M
