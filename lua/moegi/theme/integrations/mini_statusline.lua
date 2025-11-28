return {
  -- Mode highlights
  MiniStatuslineModeNormal = { fg = C.base, bg = C.blue },
  MiniStatuslineModeInsert = { fg = C.base, bg = C.green },
  MiniStatuslineModeVisual = { fg = C.base, bg = C.pink },
  MiniStatuslineModeReplace = { fg = C.base, bg = C.gold },
  MiniStatuslineModeCommand = { fg = C.base, bg = C.pale },
  MiniStatuslineModeOther = { fg = C.base, bg = C.text2 },

  -- Section highlights
  MiniStatuslineDevinfo = { fg = C.text, bg = C.overlay1 },
  MiniStatuslineFilename = { fg = C.text, bg = C.overlay0 },
  MiniStatuslineFileinfo = { fg = C.text, bg = C.overlay1 },

  -- Inactive window
  MiniStatuslineInactive = { fg = C.text2, bg = C.overlay0 },
}
