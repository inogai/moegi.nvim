local terminal_colors = {
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

local p = require("lush_theme/moegi_palette").dark

for i, color in ipairs(terminal_colors) do
  vim.g["terminal_color_" .. i - 1] = p.terminal[color]
end
