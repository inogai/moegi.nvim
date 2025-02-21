--
-- Built with,
--
--        ,gggg,
--       d8" "8I                         ,dPYb,
--       88  ,dP                         IP'`Yb
--    8888888P"                          I8  8I
--       88                              I8  8'
--       88        gg      gg    ,g,     I8 dPgg,
--  ,aa,_88        I8      8I   ,8'8,    I8dP" "8I
-- dP" "88P        I8,    ,8I  ,8'  Yb   I8P    I8
-- Yb,_,d88b,,_   ,d8b,  ,d8b,,8'_   8) ,d8     I8,
--  "Y8P"  "Y888888P'"Y88P"`Y8P' "YY8P8P88P     `Y8
--

local lush = require("lush")
local palette = require("moegi.palette")
local terminal = require("moegi.terminal")

local M = {}

---@param config moegi.ConfigComplete
function M.with_config(config)
  if not vim.o.background == "light" then
    vim.o.background = "dark"
  end

  local p = palette[vim.o.background]

  if config.set_term_colors then
    terminal.set_term_colors(vim.o.background)
  end

  local bold = config.bold
  local italic = config.italic
  local krypton = config.krypton
  local curl = config.undercurl

  local ui = p.ui

-- for k, v in pairs(p.ui_weak) do
--   ui[k] = v
-- end

-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
-- support an annotation like the following. Consult your server documentation.
-- stylua: ignore
---@diagnostic disable: undefined-global
  local theme = lush(function(injected_functions)
    local sym = injected_functions.sym
    return {
      -- The following are the Neovim (as of 0.8.0-dev+100-g371dfb174) highlight
      -- groups, mostly used for styling UI elements.
      -- Comment them out and add your own properties to override the defaults.
      -- An empty definition `{}` will clear all styling, leaving elements looking
      -- like the 'Normal' group.
      -- To be able to link to a group, it must already be defined, so you may have
      -- to reorder items as you go.
      --
      -- See :h highlight-groups
      --
      ColorColumn    { bg = ui.float_bg }, -- Columns set with 'colorcolumn'
      Conceal        { fg = ui.fg_dimmed }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
      -- Cursor         { }, -- Character under the cursor
      -- CurSearch      { }, -- Highlighting a search pattern under the cursor (see 'hlsearch')
      -- lCursor        { }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
      -- CursorIM       { }, -- Like Cursor, but used when in IME mode |CursorIM|
      -- CursorColumn   { }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
      CursorLine     { bg = ui.bg_active }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
      Directory      { fg = p.tokens.pale }, -- Directory names (and other special names in listings)
      -- DiffAdd        { }, -- Diff mode: Added line |diff.txt|
      -- DiffChange     { }, -- Diff mode: Changed line |diff.txt|
      -- DiffDelete     { }, -- Diff mode: Deleted line |diff.txt|
      -- DiffText       { }, -- Diff mode: Changed text within a changed line |diff.txt|
      -- EndOfBuffer    { }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
      -- TermCursor     { }, -- Cursor in a focused terminal
      -- TermCursorNC   { }, -- Cursor in an unfocused terminal
      -- ErrorMsg       { }, -- Error messages on the command line
      -- VertSplit      { }, -- Column separating vertically split windows
      Folded         { fg = ui.fg, bg = ui.float_bg }, -- Line used for closed folds
      -- FoldColumn     { }, -- 'foldcolumn'
      -- SignColumn template    { }, -- Column where |signs| are displayed
      -- IncSearch      { }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
      -- Substitute     { }, -- |:substitute| replacement text highlighting
      LineNr         { fg = ui.linenr }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
      -- LineNrAbove    { }, -- Line number for when the 'relativenumber' option is set, above the cursor line
      -- LineNrBelow    { }, -- Line number for when the 'relativenumber' option is set, below the cursor line
      CursorLineNr   { fg = ui.linenr_active, bg = ui.bg_active }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
      -- CursorLineFold { }, -- Like FoldColumn when 'cursorline' is set for the cursor line
      -- CursorLineSign { }, -- Like SignColumn when 'cursorline' is set for the cursor line
      -- MatchParen     { }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
      -- ModeMsg        { }, -- 'showmode' message (e.g., "-- INSERT -- ")
      -- MsgArea        { }, -- Area for messages and cmdline
      -- MsgSeparator   { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
      -- MoreMsg        { }, -- |more-prompt|
      -- NonText        { }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
      Normal         { fg = ui.fg, bg = ui.bg  }, -- Normal text
      NormalFloat    { bg = ui.float_bg }, -- Normal text in floating windows.
      -- FloatBorder    { }, -- Border of floating windows.
      -- FloatTitle     { }, -- Title of floating windows.
      -- NormalNC       { }, -- normal text in non-current windows
      -- Pmenu          { }, -- Popup menu: Normal item.
      -- PmenuSel       { }, -- Popup menu: Selected item.
      -- PmenuKind      { }, -- Popup menu: Normal item "kind"
      -- PmenuKindSel   { }, -- Popup menu: Selected item "kind"
      -- PmenuExtra     { }, -- Popup menu: Normal item "extra text"
      -- PmenuExtraSel  { }, -- Popup menu: Selected item "extra text"
      -- PmenuSbar      { }, -- Popup menu: Scrollbar.
      -- PmenuThumb     { }, -- Popup menu: Thumb of the scrollbar.
      -- Question       { }, -- |hit-enter| prompt and yes/no questions
      -- QuickFixLine   { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
      -- Search         { }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
      -- SpecialKey     { }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
      -- SpellBad       { }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
      -- SpellCap       { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
      -- SpellLocal     { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
      -- SpellRare      { }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
      StatusLine     { fg = ui.fg_dimmed, bg = ui.float_bg }, -- Status line of current window
      -- StatusLineNC   { }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
      -- TabLine        { }, -- Tab pages line, not active tab page label
      -- TabLineFill    { }, -- Tab pages line, where there are no labels
      -- TabLineSel     { }, -- Tab pages line, active tab page label
      -- Title          { }, -- Titles for output from ":set all", ":autocmd" etc.
      -- Visual         { }, -- Visual mode selection
      -- VisualNOS      { }, -- Visual mode selection when vim is "Not Owning the Selection".
      -- WarningMsg     { }, -- Warning messages
      -- Whitespace     { }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
      -- Winseparator   { }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
      -- WildMenu       { }, -- Current match in 'wildmenu' completion
      WinBar         { fg = ui.fg, bg = ui.bg}, -- Window bar of current window
      -- WinBarNC       { }, -- Window bar of not-current windows

      -- Common vim syntax groups used for all kinds of code and markup.
      -- Commented-out groups should chain up to their preferred (*) group
      -- by default.
      --
      -- See :h group-name
      --
      -- Uncomment and edit if you want more specific syntax highlighting.

      -- Comment        { }, -- Any comment

      Constant       { fg = p.tokens.pale, gui = bold  }, -- (*) Any constant
      String         { fg = p.tokens.green, gui = italic }, --   A string constant: "this is a string"
      Character      { fg = p.tokens.green, gui = italic }, --   A character constant: 'c', '\n'
      Number         { fg = p.tokens.yellow, gui = krypton }, --   A number constant: 234, 0xff
      Boolean        { fg = p.tokens.yellow, gui = krypton }, --   A boolean constant: TRUE, false
      -- Float          { }, --   A floating point constant: 2.3e10

      Identifier     { fg = p.tokens.pale }, -- (*) Any variable name
      Function       { fg = p.tokens.cyan }, --   Function name (also: methods for classes)

      Statement      { fg = p.tokens.pink, gui = krypton }, -- (*) Any statement
      -- Conditional    { }, --   if, then, else, endif, switch, etc.
      -- Repeat         { }, --   for, do, while, etc.
      -- Label          { }, --   case, default, etc.
      Operator       { fg = p.tokens.pink }, --   "sizeof", "+", "*", etc.
      -- Keyword        { }, --   any other keyword
      -- Exception      { }, --   try, catch, throw

      PreProc        { fg = p.tokens.cyan }, -- (*) Generic Preprocessor
      -- Include        { }, --   Preprocessor #include
      -- Define         { }, --   Preprocessor #define
      -- Macro          { }, --   Same as Define
      -- PreCondit      { }, --   Preprocessor #if, #else, #endif, etc.

      Type           { fg = p.tokens.orange }, -- (*) int, long, char, etc.
      -- StorageClass   { }, --   static, register, volatile, etc.
      -- Structure      { }, --   struct, union, enum, etc.
      -- Typedef        { }, --   A typedef

      Special        { fg = p.tokens.cyan }, -- (*) Any special symbol
      -- SpecialChar    { }, --   Special character in a constant
      -- Tag            { }, --   You can use CTRL-] on this
      Delimiter      { fg = p.tokens.gray }, --   Character that needs attention
      -- SpecialComment { }, --   Special things inside a comment (e.g. '\n')
      -- Debug          { }, --   Debugging statements

      -- Underlined     { gui = "underline" }, -- Text that stands out, HTML links
      -- Ignore         { }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
      -- Error          { }, -- Any erroneous construct
      -- Todo           { }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

      -- These groups are for the native LSP client and diagnostic system. Some
      -- other LSP clients may use these groups, or use their own. Consult your
      -- LSP client's documentation.

      -- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
      --
      -- LspReferenceText            { } , -- Used for highlighting "text" references
      -- LspReferenceRead            { } , -- Used for highlighting "read" references
      -- LspReferenceWrite           { } , -- Used for highlighting "write" references
      LspCodeLens                 { fg = ui.codelens } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
      -- LspCodeLensSeparator        { } , -- Used to color the seperator between two or more code lens.
      -- LspSignatureActiveParameter { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

      -- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
      --
      DiagnosticError            { fg = p.diagnostics.error } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
      DiagnosticWarn             { fg = p.diagnostics.warn } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
      DiagnosticInfo             { fg = p.diagnostics.info } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
      DiagnosticHint             { fg = p.diagnostics.hint } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
      DiagnosticOk               { fg = p.diagnostics.ok } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
      -- DiagnosticVirtualTextError { } , -- Used for "Error" diagnostic virtual text.
      -- DiagnosticVirtualTextWarn  { } , -- Used for "Warn" diagnostic virtual text.
      -- DiagnosticVirtualTextInfo  { } , -- Used for "Info" diagnostic virtual text.
      -- DiagnosticVirtualTextHint  { } , -- Used for "Hint" diagnostic virtual text.
      -- DiagnosticVirtualTextOk    { } , -- Used for "Ok" diagnostic virtual text.
      DiagnosticUnderlineError   { gui = curl, sp = p.diagnostics.error } , -- Used to underline "Error" diagnostics.
      DiagnosticUnderlineWarn    { gui = curl, sp = p.diagnostics.warn } , -- Used to underline "Warn" diagnostics.
      DiagnosticUnderlineInfo    { gui = curl, sp = p.diagnostics.info } , -- Used to underline "Info" diagnostics.
      DiagnosticUnderlineHint    { gui = curl, sp = p.diagnostics.error  } , -- Used to underline "Hint" diagnostics.
      DiagnosticUnderlineOk      { gui = curl, sp = p.diagnostics.ok } , -- Used to underline "Ok" diagnostics.
      -- DiagnosticFloatingError    { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
      -- DiagnosticFloatingWarn     { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
      -- DiagnosticFloatingInfo     { } , -- Used to color "Info" diagnostic messages in diagnostics float.
      -- DiagnosticFloatingHint     { } , -- Used to color "Hint" diagnostic messages in diagnostics float.
      -- DiagnosticFloatingOk       { } , -- Used to color "Ok" diagnostic messages in diagnostics float.
      -- DiagnosticSignError        { } , -- Used for "Error" signs in sign column.
      -- DiagnosticSignWarn         { } , -- Used for "Warn" signs in sign column.
      -- DiagnosticSignInfo         { } , -- Used for "Info" signs in sign column.
      -- DiagnosticSignHint         { } , -- Used for "Hint" signs in sign column.
      -- DiagnosticSignOk           { } , -- Used for "Ok" signs in sign column.

      -- Tree-Sitter syntax groups.
      --
      -- See :h treesitter-highlight-groups, some groups may not be listed,
      -- submit a PR fix to lush-template!
      --
      -- Tree-Sitter groups are defined with an "@" symbol, which must be
      -- specially handled to be valid lua code, we do this via the special
      -- sym function. The following are all valid ways to call the sym function,
      -- for more details see https://www.lua.org/pil/5.html
      --
      -- sym("@text.literal")
      -- sym('@text.literal')
      -- sym"@text.literal"
      -- sym'@text.literal'
      --
      -- For more information see https://github.com/rktjmp/lush.nvim/issues/109

      -- sym"@text.literal"      { }, -- Comment
      -- sym"@text.reference"    { }, -- Identifier
      -- sym"@text.title"        { }, -- Title
      -- sym"@text.uri"          { }, -- Underlined
      -- sym"@text.underline"    { }, -- Underlined
      -- sym"@text.todo"         { }, -- Todo
      -- sym"@comment"           { }, -- Comment
      -- sym"@punctuation"       { }, -- Delimiter
      -- sym"@constant"          { }, -- Constant
      -- sym"@constant.builtin"  { }, -- Special
      -- sym"@constant.macro"    { }, -- Define
      -- sym"@define"            { }, -- Define
      -- sym"@macro"             { }, -- Macro
      -- sym"@string"            { }, -- String
      -- sym"@string.escape"     { }, -- SpecialChar
      -- sym"@string.special"    { }, -- SpecialChar
      -- sym"@character"         { }, -- Character
      -- sym"@character.special" { }, -- SpecialChar
      -- sym"@number"            { }, -- Number
      -- sym"@boolean"           { }, -- Boolean
      -- sym"@float"             { }, -- Float
      -- sym"@function"          { }, -- Function
      -- sym"@function.builtin"  { }, -- Special
      -- sym"@function.macro"    { }, -- Macro
      -- sym"@parameter"         { }, -- Identifier
      -- sym"@method"            { }, -- Function
      -- sym"@field"             { }, -- Identifier
      -- sym"@property"          { }, -- Identifier
      -- sym"@constructor"       { }, -- Special
      -- sym"@conditional"       { }, -- Conditional
      -- sym"@repeat"            { }, -- Repeat
      -- sym"@label"             { }, -- Label
      -- sym"@operator"          { }, -- Operator
      -- sym"@keyword"           { }, -- Keyword
      -- sym"@exception"         { }, -- Exception
      sym"@variable"          { Identifier }, -- Identifier
      -- sym"@type"              { }, -- Type
      -- sym"@type.definition"   { }, -- Typedef
      sym"@type.builtin.cpp" { Statement }, -- Statement
      -- sym"@storageclass"      { }, -- StorageClass
      -- sym"@structure"         { }, -- Structure
      -- sym"@namespace"         { }, -- Identifier
      -- sym"@include"           { }, -- Include
      -- sym"@preproc"           { }, -- PreProc
      -- sym"@debug"             { }, -- Debug
      -- sym"@tag"               { }, -- Tag

      TreesitterContext { fg = p.ui.fg, bg = p.ui.float_bg },
      TreesitterContextLineNumber { fg = p.ui.linenr, bg = p.ui.float_bg },

      LspInlayHint { fg = ui.inlayhint, bg = ui.inlayhint_bg, gui = krypton },
      CmpGhostText { fg = ui.fg_dimmed, gui = krypton },

      DashboardIcon   { fg = ui.fg_dimmed },
      DashboardDesc   { fg = ui.fg_dimmed },
      DashboardKey    { fg = ui.fg_dimmed },
      DashboardFooter { fg = p.tokens.green, gui = italic },

      RainbowDelimiter1 { fg = p.rainbow[1] },
      RainbowDelimiter2 { fg = p.rainbow[2] },
      RainbowDelimiter3 { fg = p.rainbow[3] },
      RainbowDelimiter4 { fg = p.rainbow[4] },

      NotifyERRORIcon   { fg = p.diagnostics.error },
      NotifyWARNIcon    { fg = p.diagnostics.warn },
      NotifyINFOIcon    { fg = p.diagnostics.info },
      NotifyLOGIcon     { fg = p.diagnostics.ok },
      NotifyTRACEIcon   { fg = p.diagnostics.trace },

      NotifyERRORTitle  { fg = p.diagnostics.error },
      NotifyWARNTitle   { fg = p.diagnostics.warn },
      NotifyINFOTitle   { fg = p.diagnostics.info },
      NotifyLOGTitle    { fg = p.diagnostics.ok },
      NotifyTRACETitle  { fg = p.diagnostics.trace },

      NotifyERRORBorder { gui = bold, fg = p.diagnostics.error },
      NotifyWARNBorder  { gui = bold, fg = p.diagnostics.warn },
      NotifyINFOBorder  { gui = bold, fg = p.diagnostics.info },
      NotifyLOGBorder   { gui = bold, fg = p.diagnostics.ok },
      NotifyTRACEBorder { gui = bold, fg = p.diagnostics.trace },

      DapUIScope        { fg = p.tokens.pale },
      DapUIType         { fg = p.tokens.orange },
      DapUiSource       { fg = p.tokens.green },

      DapUIStepOver     { fg = p.tokens.cyan },
      DapUIStepInto     { fg = p.tokens.cyan },
      DapUIStepBack     { fg = p.tokens.cyan },
      DapUIContinue     { fg = p.tokens.cyan },
      DapUIModifiedValue{ fg = p.tokens.yellow },

      DapUIPlayPause    { fg = p.tokens.green },
      DapUIStop         { fg = p.diagnostics.error },

      DapUIBreakpointsCurrentLine { fg = p.tokens.red },
      DapUICurrentFrameName       { fg = p.tokens.pale },

      DapUILineNumber   { fg = p.ui.linenr_active },
      DapUIWatchesEmpty { fg = p.ui.fg_dimmed },
    }
  end)

  return theme
end

return M

-- vi:nowrap
