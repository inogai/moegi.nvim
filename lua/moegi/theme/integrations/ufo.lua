local lush, U, C, c = require("moegi")._init()
-- https://github.com/kevinhwang91/nvim-ufo#highlight-groups

-- stylua: ignore
---@diagnostic disable: undefined-global
return lush(function(injected_functions)
  return {
    UfoFoldedFg { fg = C.pale }, -- Foreground for raw text of folded line.
    UfoFoldedBg { bg = C.surface1 }, -- Background of folded line.
    -- UfoPreviewSbar { }, -- Scroll bar of preview window, only take effect if the border is missing right horizontal line, like border = 'none'.
    -- UfoPreviewCursorLine { }, -- Highlight current line in preview window if it isn't the start of folded lines.
    -- UfoPreviewWinBar { }, -- WinBar of preview window.
    -- UfoPreviewThumb { }, -- Thumb of preview window.
    -- UfoFoldedEllipsis { }, -- Ellipsis at the end of folded line, invalid if fold_virt_text_handler is set.
    -- UfoCursorFoldedLine { }, -- Highlight the folded line under the cursor
  }
end)
