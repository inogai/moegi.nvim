local lush, U, C, c = require("moegi")._init()
-- https://github.com/nvim-mini/mini.nvim/blob/main/doc/mini-icons.txt

-- stylua: ignore
---@diagnostic disable: undefined-global
return lush(function(injected_functions)
  return {
    MiniIconsAzure  { fg = U.darken(C.cyan, 0.4, C.blue) }, -- We don't have azure in palette, let's mix one
    MiniIconsBlue   { fg = C.blue },
    MiniIconsCyan   { fg = C.cyan },
    MiniIconsGreen  { fg = C.green },
    MiniIconsGray   { fg = C.subtext0 }, -- Use subtext0 over gray for visibility
    MiniIconsOrange { fg = C.orange },
    MiniIconsPurple { fg = C.purple },
    MiniIconsRed    { fg = C.red },
    MiniIconsYellow { fg = C.gold }, -- gold generally blends better. Use yellow only for warning highlights
  }
end)
