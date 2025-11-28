return {
  FzfLuaNormal = { link = "Pmenu" }, -- Main win fg/bg
  FzfLuaBorder = { link = "PmenuBorder" }, -- Main win border
  FzfLuaTitle = { "FzfLuaNormal", gui = { "bold" } }, -- Main win title
  FzfLuaTitleFlags = { fg = C.text2, bg = C.overlay1 }, -- Main win title flags
  FzfLuaBackdrop = { bg = C.solid }, -- Backdrop color
  -- FzfLuaPreviewNormal = {}, -- Builtin preview fg/bg
  -- FzfLuaPreviewBorder = {}, -- Builtin preview border
  -- FzfLuaPreviewTitle = {}, -- Builtin preview title
  -- FzfLuaCursor = {}, -- Builtin preview Cursor
  -- FzfLuaCursorLine = {}, -- Builtin preview Cursorline
  -- FzfLuaCursorLineNr = {}, -- Builtin preview CursorLineNr
  -- FzfLuaSearch = {}, -- Builtin preview search matches
  -- FzfLuaScrollBorderEmpty = {}, -- Builtin preview border scroll empty
  -- FzfLuaScrollBorderFull = {}, -- Builtin preview border scroll full
  -- FzfLuaScrollFloatEmpty = {}, -- Builtin preview float scroll empty
  -- FzfLuaScrollFloatFull = {}, -- Builtin preview float scroll full
  -- FzfLuaHelpNormal = {}, -- Help win fg/bg
  -- FzfLuaHelpBorder = {}, -- Help win border
  FzfLuaHeaderBind = { fg = C.gold }, -- Header keybind
  FzfLuaHeaderText = { fg = C.pale, gui = { "bold" } }, -- Header text
  -- FzfLuaPathColNr = {}, -- Path col nr (qf,lsp,diag)
  -- FzfLuaPathLineNr = {}, -- Path line nr (qf,lsp,diag)
  -- FzfLuaBufName = {}, -- Buffer name (lines)
  -- FzfLuaBufId = {}, -- Buffer ID (lines)
  -- FzfLuaBufNr = {}, -- Buffer number (buffers,tabs)
  -- FzfLuaBufLineNr = {}, -- Buffer line nr (lines,blines)
  -- FzfLuaBufFlagCur = {}, -- Buffer line (buffers)
  -- FzfLuaBufFlagAlt = {}, -- Buffer line (buffers)
  -- FzfLuaTabTitle = {}, -- Tab title (tabs)
  -- FzfLuaTabMarker = {}, -- Tab marker (tabs)
  -- FzfLuaDirIcon = {}, -- Paths directory icon
  -- FzfLuaDirPart = {}, -- Path formatters directory hl group
  -- FzfLuaFilePart = {}, -- Path formatters file hl group
  -- FzfLuaLivePrompt = {}, -- "live" queries prompt text
  -- FzfLuaLiveSym = {}, -- LSP live symbols query match
  -- FzfLuaCmdEx = {}, -- Ex commands in commands
  -- FzfLuaCmdBuf = {}, -- Buffer commands in commands
  -- FzfLuaCmdGlobal = {}, -- Global commands in commands
  FzfLuaFzfNormal = { "Normal" }, -- fzf's fg|bg
  -- FzfLuaFzfCursorLine = {}, -- fzf's fg+|bg+
  -- FzfLuaFzfMatch = {}, -- fzf's hl+
  -- FzfLuaFzfBorder = {}, -- fzf's border
  -- FzfLuaFzfScrollbar = {}, -- fzf's scrollbar
  -- FzfLuaFzfSeparator = {}, -- fzf's separator
  -- FzfLuaFzfGutter = {}, -- fzf's gutter (hl bg is used)
  -- FzfLuaFzfHeader = {}, -- fzf's header
  -- FzfLuaFzfInfo = {}, -- fzf's info
  -- FzfLuaFzfPointer = {}, -- fzf's pointer
  -- FzfLuaFzfMarker = {}, -- fzf's marker
  -- FzfLuaFzfSpinner = {}, -- fzf's spinner
  -- FzfLuaFzfPrompt = {}, -- fzf's prompt
  -- FzfLuaFzfQuery = {}, -- fzf's header
}
