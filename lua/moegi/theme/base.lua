---@type table<string, vim.api.keyset.highlight>
-- stylua: ignore
return {
  -- ColorColumn    = {},                             -- Columns set with 'colorcolumn'
  Conceal        = { fg = C.muted },                             -- Placeholder characters substituted for concealed text (see 'conceallevel')
  -- Cursor         = {}, -- Character under the cursor
  -- CurSearch      = {}, -- Highlighting a search pattern under the cursor (see 'hlsearch')
  -- lCursor        = {}, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
  -- CursorIM       = {}, -- Like Cursor, but used when in IME mode |CursorIM|
  CursorColumn   = { bg = C.overlay1 },                              -- Screen-column at the cursor, when 'cursorcolumn' is set.
  CursorLine     = { bg = C.overlay1 },             -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
  Directory      = { fg = C.pale },                                -- Directory names (and other special names in listings)
  -- DiffAdd        = {}, -- Diff mode: Added line |diff.txt|
  -- DiffChange     = {}, -- Diff mode: Changed line |diff.txt|
  -- DiffDelete     = {}, -- Diff mode: Deleted line |diff.txt|
  -- DiffText       = {}, -- Diff mode: Changed text within a changed line |diff.txt|
  -- EndOfBuffer    = {}, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
  -- TermCursor     = {}, -- Cursor in a focused terminal
  -- TermCursorNC   = {}, -- Cursor in an unfocused terminal
  -- ErrorMsg       = {}, -- Error messages on the command line
  -- VertSplit      = {}, -- Column separating vertically split windows
  Folded         = { fg = C.pale, bg = C.surface1 },               -- Line used for closed folds
  FoldColumn     = { fg = C.muted },                             -- 'foldcolumn'
  SignColumn     = { fg = C.muted },                             -- Column where |signs| are displayed
  SignColumnSB   = { bg = C.overlay1, fg = C.muted },             -- Column where |signs| are displayed
  -- IncSearch      = {}, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
  -- Substitute     = {}, -- |:substitute| replacement text highlighting
  LineNr         = { fg = C.muted },                             -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
  -- LineNrAbove    = {}, -- Line number for when the 'relativenumber' option is set, above the cursor line
  -- LineNrBelow    = {}, -- Line number for when the 'relativenumber' option is set, below the cursor line
  CursorLineNr   = { fg = C.text2, bg = C.overlay1 },   -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
  -- CursorLineFold = {}, -- Like FoldColumn when 'cursorline' is set for the cursor line
  -- CursorLineSign = {}, -- Like SignColumn when 'cursorline' is set for the cursor line
  -- MatchParen     = {}, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
  -- ModeMsg        = {}, -- 'showmode' message (e.g., "-- INSERT -- ")
  -- MsgArea        = {}, -- Area for messages and cmdline
  -- MsgSeparator   = {}, -- Separator for scrolled messages, `msgsep` flag of 'display'
  -- MoreMsg        = {}, -- |more-prompt|
  -- NonText        = {}, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
  Normal         = { fg = C.text, bg = C.base },                   -- Normal text
  NormalFloat    = { bg = C.solid },                              -- Normal text in floating windows.
  -- FloatBorder    = {}, -- Border of floating windows.
  -- FloatTitle     = {}, -- Title of floating windows.
  -- NormalNC       = {}, -- normal text in non-current windows
  -- Pmenu          = {}, -- Popup menu: Normal item.
  -- PmenuSel       = {}, -- Popup menu: Selected item.
  -- PmenuKind      = {}, -- Popup menu: Normal item "kind"
  -- PmenuKindSel   = {}, -- Popup menu: Selected item "kind"
  -- PmenuExtra     = {}, -- Popup menu: Normal item "extra text"
  -- PmenuExtraSel  = {}, -- Popup menu: Selected item "extra text"
  -- PmenuSbar      = {}, -- Popup menu: Scrollbar.
  -- PmenuThumb     = {}, -- Popup menu: Thumb of the scrollbar.
  -- Question       = {}, -- |hit-enter| prompt and yes/no questions
  -- QuickFixLine   = {}, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
  -- Search         = {}, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
  -- SpecialKey     = {}, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
  -- SpellBad       = {}, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
  -- SpellCap       = {}, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
  -- SpellLocal     = {}, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
  -- SpellRare      = {}, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
  StatusLine     = { fg = C.text2, bg = C.solid },                   -- Status line of current window
  -- StatusLineNC   = {}, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
  -- TabLine        = {}, -- Tab pages line, not active tab page label
  -- TabLineFill    = {}, -- Tab pages line, where there are no labels
  -- TabLineSel     = {}, -- Tab pages line, active tab page label
  -- Title          = {}, -- Titles for output from ":set all", ":autocmd" etc.
  -- Visual         = {}, -- Visual mode selection
  -- VisualNOS      = {}, -- Visual mode selection when vim is "Not Owning the Selection".
  -- WarningMsg     = {}, -- Warning messages
  -- Whitespace     = {}, -- "nbsp", "space", "tab" and "trail" in 'listchars'
  -- Winseparator   = {}, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
  -- WildMenu       = {}, -- Current match in 'wildmenu' completion
  WinBar         = { fg = C.text, bg = C.base },                   -- Window bar of current window
  -- WinBarNC       = {}, -- Window bar of not-current windows
}
