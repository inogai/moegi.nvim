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
  -- DiffTextAdd    = {}, -- Diff mode: Added text within a changed line. Linked to |hl-DiffText| by default. |diff.txt|
  -- EndOfBuffer    = {}, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
  -- TermCursor     = {}, -- Cursor in a focused terminal
  -- TermCursorNC   = {}, -- Cursor in an unfocused terminal
  -- ErrorMsg       = {}, -- Error messages on the command line
  -- OkMsg          = {}, -- Success messages.
  -- StderrMsg      = {}, -- Messages in stderr from shell commands.
  -- StdoutMsg      = {}, -- Messages in stdout from shell commands.
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
  -- FloatShadow    = {}, -- Blended areas when border is "shadow".
  -- FloatShadowThrough = {}, -- Shadow corners when border is "shadow".
  -- FloatFooter    = {}, -- Footer of floating windows.
  -- NormalNC       = {}, -- normal text in non-current windows
  Pmenu          = { bg = C.solid }, -- Popup menu: Normal item.
  PmenuSel       = { bg = C.text, fg = C.solid }, -- Popup menu: Selected item.
  -- PmenuKind      = {}, -- Popup menu: Normal item "kind"
  -- PmenuKindSel   = {}, -- Popup menu: Selected item "kind"
  -- PmenuExtra     = {}, -- Popup menu: Normal item "extra text"
  -- PmenuExtraSel  = {}, -- Popup menu: Selected item "extra text"
  -- PmenuSbar      = {}, -- Popup menu: Scrollbar.
  -- PmenuThumb     = {}, -- Popup menu: Thumb of the scrollbar.
  -- PmenuMatch     = {}, -- Popup menu: Matched text in normal item. Combined with |hl-Pmenu|.
  -- PmenuMatchSel  = {}, -- Popup menu: Matched text in selected item. Combined with |hl-PmenuMatch| and |hl-PmenuSel|.
  PmenuBorder    = { fg = C.muted, bg = C.solid }, -- Popup menu: border of popup menu.
  -- PmenuShadow    = {}, -- Popup menu: blended areas when 'pumborder' is "shadow".
  -- PmenuShadowThrough = {}, -- Popup menu: shadow corners when 'pumborder' is "shadow".
  -- ComplMatchIns   = {}, -- Matched text of the currently inserted completion.
  -- PreInsert       = {}, -- Text inserted when "preinsert" is in 'completeopt'.
  -- ComplHint       = {}, -- Virtual text of the currently selected completion.
  -- ComplHintMore   = {}, -- The additional information of the virtual text.
  -- Question       = {}, -- |hit-enter| prompt and yes/no questions
  -- QuickFixLine   = {}, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
  -- Search         = {}, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
  -- SnippetTabstop = {}, -- Tabstops in snippets. |vim.snippet|
  -- SnippetTabstopActive = {}, -- The currently active tabstop. |vim.snippet|
  -- SpecialKey     = {}, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
  -- SpellBad       = {}, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
  -- SpellCap       = {}, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
  -- SpellLocal     = {}, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
  -- SpellRare      = {}, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
  StatusLine     = { fg = C.text2, bg = C.solid },                   -- Status line of current window
  -- StatusLineNC   = {}, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
  -- StatusLineTerm = {}, -- Status line of |terminal| window.
  -- StatusLineTermNC = {}, -- Status line of non-current |terminal| windows.
  -- TabLine        = {}, -- Tab pages line, not active tab page label
  -- TabLineFill    = {}, -- Tab pages line, where there are no labels
  -- TabLineSel     = {}, -- Tab pages line, active tab page label
  -- Title          = {}, -- Titles for output from ":set all", ":autocmd" etc.
  -- Visual         = {}, -- Visual mode selection
  -- VisualNOS      = {}, -- Visual mode selection when vim is "Not Owning the Selection".
  -- WarningMsg     = {}, -- Warning messages
  -- Whitespace     = {}, -- "nbsp", "space", "tab" and "trail" in 'listchars'
  WinSeparator   = { fg = C.muted }, -- Separators between window splits.
  -- WildMenu       = {}, -- Current match in 'wildmenu' completion
  WinBar         = { fg = C.text, bg = C.base },                   -- Window bar of current window
  -- WinBarNC       = {}, -- Window bar of not-current windows
}
