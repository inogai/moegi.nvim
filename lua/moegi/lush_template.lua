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

local default_config = require("moegi.config").default_config
local c = vim.tbl_deep_extend("force", default_config, vim.g.moegi_config or {})

local flavour = vim.opt.background:get() == "light" and c.flavour_light or c.flavour_dark
vim.g.moegi_current_flavour = flavour

local U = require("moegi.utils")
local C = require("moegi.flavour.dark")

if flavour == "light" then
  U.bg = "#000000"
  U.fg = "#FFFFFF"
  C = require("moegi.flavour.light")
end

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
    ColorColumn    { bg = C.surface0 }, -- Columns set with 'colorcolumn'
    Conceal        { fg = C.subtext1 }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
    -- Cursor         { }, -- Character under the cursor
    -- CurSearch      { }, -- Highlighting a search pattern under the cursor (see 'hlsearch')
    -- lCursor        { }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
    -- CursorIM       { }, -- Like Cursor, but used when in IME mode |CursorIM|
    CursorColumn   { bg = C.surface0 }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine     { bg = U.lighten(C.base, 0.91) }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
    Directory      { fg = C.pale }, -- Directory names (and other special names in listings)
    -- DiffAdd        { }, -- Diff mode: Added line |diff.txt|
    -- DiffChange     { }, -- Diff mode: Changed line |diff.txt|
    -- DiffDelete     { }, -- Diff mode: Deleted line |diff.txt|
    -- DiffText       { }, -- Diff mode: Changed text within a changed line |diff.txt|
    -- EndOfBuffer    { }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
    -- TermCursor     { }, -- Cursor in a focused terminal
    -- TermCursorNC   { }, -- Cursor in an unfocused terminal
    -- ErrorMsg       { }, -- Error messages on the command line
    -- VertSplit      { }, -- Column separating vertically split windows
    Folded         { fg = C.pale, bg = C.surface1 }, -- Line used for closed folds
    FoldColumn     { fg = C.overlay0 }, -- 'foldcolumn'
    SignColumn     { fg = C.overlay0 }, -- Column where |signs| are displayed
    SignColumnSB   { bg = C.surface1, fg = C.overlay0 }, -- Column where |signs| are displayed
    -- IncSearch      { }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    -- Substitute     { }, -- |:substitute| replacement text highlighting
    LineNr         { fg = C.overlay0 }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    -- LineNrAbove    { }, -- Line number for when the 'relativenumber' option is set, above the cursor line
    -- LineNrBelow    { }, -- Line number for when the 'relativenumber' option is set, below the cursor line
    CursorLineNr   { fg = C.subtext1, bg = U.lighten(C.base, 0.91) }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    -- CursorLineFold { }, -- Like FoldColumn when 'cursorline' is set for the cursor line
    -- CursorLineSign { }, -- Like SignColumn when 'cursorline' is set for the cursor line
    -- MatchParen     { }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    -- ModeMsg        { }, -- 'showmode' message (e.g., "-- INSERT -- ")
    -- MsgArea        { }, -- Area for messages and cmdline
    -- MsgSeparator   { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    -- MoreMsg        { }, -- |more-prompt|
    -- NonText        { }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Normal         { fg = C.text, bg = C.base }, -- Normal text
    NormalFloat    { bg = C.surface0 }, -- Normal text in floating windows.
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
    StatusLine     { fg = C.subtext1, bg = C.surface0 }, -- Status line of current window
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
    WinBar         { fg = C.text, bg = C.base }, -- Window bar of current window
    -- WinBarNC       { }, -- Window bar of not-current windows

    -- Common vim syntax groups used for all kinds of code and markup.
    -- Commented-out groups should chain up to their preferred (*) group
    -- by default.
    --
    -- See :h group-name
    --
    -- Uncomment and edit if you want more specific syntax highlighting.

    -- Comment        { }, -- Any comment

    Constant       { fg = C.pale, gui = c.constant_gui }, -- (*) Any constant
    String         { fg = C.green, gui = c.string_gui }, --   A string constant: "this is a string"
    Character      { fg = C.green, gui = c.string_gui }, --   A character constant: 'c', '\n'
    Number         { fg = C.gold, gui = c.keyword_gui }, --   A number constant: 234, 0xff
    Boolean        { fg = C.gold, gui = c.keyword_gui }, --   A boolean constant: TRUE, false
    -- Float          { }, --   A floating point constant: 2.3e10

    Identifier     { fg = C.pale }, -- (*) Any variable name
    Function       { fg = C.cyan }, --   Function name (also: methods for classes)

    Statement      { fg = C.pink, gui = c.keyword_gui }, -- (*) Any statement
    -- Conditional    { }, --   if, then, else, endif, switch, etc.
    -- Repeat         { }, --   for, do, while, etc.
    -- Label          { }, --   case, default, etc.
    Operator       { fg = C.pink }, --   "sizeof", "+", "*", etc.
    -- Keyword        { }, --   any other keyword
    -- Exception      { }, --   try, catch, throw

    PreProc        { fg = C.cyan }, -- (*) Generic Preprocessor
    -- Include        { }, --   Preprocessor #include
    -- Define         { }, --   Preprocessor #define
    -- Macro          { }, --   Same as Define
    -- PreCondit      { }, --   Preprocessor #if, #else, #endif, etc.

    Type           { fg = C.orange }, -- (*) int, long, char, etc.
    -- StorageClass   { }, --   static, register, volatile, etc.
    -- Structure      { }, --   struct, union, enum, etc.
    -- Typedef        { }, --   A typedef

    Special        { fg = C.cyan }, -- (*) Any special symbol
    -- SpecialChar    { }, --   Special character in a constant
    -- Tag            { }, --   You can use CTRL-] on this
    Delimiter      { fg = C.gray }, --   Character that needs attention
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
    -- LspReferenceTarget          { } , -- Used for highlighting reference targets (e.g. in a hover range)
    LspInlayHint                { fg = C.inlayhint, bg = U.vary_color({ dark = C.surface1, light = U.lighten(C.inlayhint, 0.15) }) } , -- Used for highlighting inlay hints
    LspCodeLens                 { fg = C.overlay0 } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
    -- LspCodeLensSeparator        { } , -- Used to color the separator between two or more code lenses.
    -- LspSignatureActiveParameter { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

    -- ``:h diagnostic-highlights``
    -- NOTE: The colors are slightly different from VSCode's for simplicity
    DiagnosticError             { fg = C.red } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticWarn              { fg = C.yellow } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticInfo              { fg = C.blue } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticHint              { fg = C.cyan } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticOk                { fg = U.darken(C.green, 0.9) } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticVirtualTextError  { } , -- Used for "Error" diagnostic virtual text.
    -- DiagnosticVirtualTextWarn   { } , -- Used for "Warn" diagnostic virtual text.
    -- DiagnosticVirtualTextInfo   { } , -- Used for "Info" diagnostic virtual text.
    -- DiagnosticVirtualTextHint   { } , -- Used for "Hint" diagnostic virtual text.
    -- DiagnosticVirtualTextOk     { } , -- Used for "Ok" diagnostic virtual text.
    -- DiagnosticVirtualLinesError { } , -- Used for "Error" diagnostic virtual lines.
    -- DiagnosticVirtualLinesWarn  { } , -- Used for "Warn" diagnostic virtual lines
    -- DiagnosticVirtualLinesInfo  { } , -- Used for "Info" diagnostic virtual lines.
    -- DiagnosticVirtualLinesHint  { } , -- Used for "Hint" diagnostic virtual lines
    -- DiagnosticVirtualLinesOk    { } , -- Used for "Ok" diagnostic virtual lines.
    DiagnosticUnderlineError    { gui = c.diagnostic_underline_gui, sp = C.red } , -- Used to underline "Error" diagnostics.
    DiagnosticUnderlineWarn     { gui = c.diagnostic_underline_gui, sp = C.yellow } , -- Used to underline "Warn" diagnostics.
    DiagnosticUnderlineInfo     { gui = c.diagnostic_underline_gui, sp = C.blue } , -- Used to underline "Info" diagnostics.
    DiagnosticUnderlineHint     { gui = c.diagnostic_underline_gui, sp = C.cyan  } , -- Used to underline "Hint" diagnostics.
    DiagnosticUnderlineOk       { gui = c.diagnostic_underline_gui, sp = U.darken(C.green, 0.9) } , -- Used to underline "Ok" diagnostics.
    -- DiagnosticFloatingError     { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
    -- DiagnosticFloatingWarn      { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingInfo      { } , -- Used to color "Info" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingHint      { } , -- Used to color "Hint" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingOk        { } , -- Used to color "Ok" diagnostic messages in diagnostics float.
    -- DiagnosticSignError         { } , -- Used for "Error" signs in sign column.
    -- DiagnosticSignWarn          { } , -- Used for "Warn" signs in sign column.
    -- DiagnosticSignInfo          { } , -- Used for "Info" signs in sign column.
    -- DiagnosticSignHint          { } , -- Used for "Hint" signs in sign column.
    -- DiagnosticSignOk            { } , -- Used for "Ok" signs in sign column.
    -- DiagnosticDeprecated        { } , -- Used for deprecated or obsolete code.
    -- DiagnosticUnnecessary       { } , -- Used for unnecessary or unused code.

    -- Tree-Sitter syntax groups.
    -- ``:h treesitter-highlight-groups``
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
    sym"@type.builtin.cpp"  { Statement }, -- Statement
    -- sym"@storageclass"      { }, -- StorageClass
    -- sym"@structure"         { }, -- Structure
    -- sym"@namespace"         { }, -- Identifier
    -- sym"@include"           { }, -- Include
    -- sym"@preproc"           { }, -- PreProc
    -- sym"@debug"             { }, -- Debug
    -- sym"@tag"               { }, -- Tag

    rainbow1                  { fg = C.red },
    rainbow2                  { fg = C.orange },
    rainbow3                  { fg = C.yellow },
    rainbow4                  { fg = C.green },
    rainbow5                  { fg = C.cyan },
    rainbow6                  { fg = C.blue },

    sym"@markup.strong"       { fg = C.pale, gui = "bold" },
    sym"@markup.italic"       { fg = C.pale, gui = "italic" },

    -- Tree-Sitter Markdown syntax groups.
    sym"@markup.heading.1.markdown" { rainbow1 },
    sym"@markup.heading.2.markdown" { rainbow2 },
    sym"@markup.heading.3.markdown" { rainbow3 },
    sym"@markup.heading.4.markdown" { rainbow4 },
    sym"@markup.heading.5.markdown" { rainbow5 },
    sym"@markup.heading.6.markdown" { rainbow6 },

    -- 'render-markdown.nvim' integration
    -- See <https://github.com/MeanderingProgrammer/render-markdown.nvim#colors>
    RenderMarkdownH1              { rainbow1 }, -- H1 icons
    RenderMarkdownH2              { rainbow2 }, -- H2 icons
    RenderMarkdownH3              { rainbow3 }, -- H3 icons
    RenderMarkdownH4              { rainbow4 }, -- H4 icons
    RenderMarkdownH5              { rainbow5 }, -- H5 icons
    RenderMarkdownH6              { rainbow6 }, -- H6 icons
    RenderMarkdownH1Bg            { bg = U.darken(C.red, 0.3) }, -- H1 background line,
    RenderMarkdownH2Bg            { bg = U.darken(C.orange, 0.3) },
    RenderMarkdownH3Bg            { bg = U.darken(C.yellow, 0.3) },
    RenderMarkdownH4Bg            { bg = U.darken(C.green, 0.3) },
    RenderMarkdownH5Bg            { bg = U.darken(C.cyan, 0.3) },
    RenderMarkdownH6Bg            { bg = U.darken(C.blue, 0.3) },
    RenderMarkdownCode            { bg = C.surface0 }, -- Code block background
    -- RenderMarkdownCodeInfo        { }, -- Code info, after language
    -- RenderMarkdownCodeBorder      { }, -- Code border background
    -- RenderMarkdownCodeFallback    { }, -- Fallback for code language
    -- RenderMarkdownCodeInline      { }, -- Inline code background
    -- RenderMarkdownQuote           { }, -- Default for block quote
    -- RenderMarkdownQuote1          { }, -- Level 1 block quote marker
    -- RenderMarkdownQuote2          { }, -- Level 2 block quote marker
    -- RenderMarkdownQuote3          { }, -- Level 3 block quote marker
    -- RenderMarkdownQuote4          { }, -- Level 4 block quote marker
    -- RenderMarkdownQuote5          { }, -- Level 5 block quote marker
    -- RenderMarkdownQuote6          { }, -- Level 6 block quote marker
    -- RenderMarkdownInlineHighlight { }, -- Inline highlights contents
    RenderMarkdownBullet          { Special }, -- List item bullet points
    -- RenderMarkdownDash            { }, -- Thematic break line
    -- RenderMarkdownSign            { }, -- Sign column background
    -- RenderMarkdownMath            { }, -- Latex lines
    -- RenderMarkdownIndent          { }, -- Indent icon
    -- RenderMarkdownHtmlComment     { }, -- HTML comment inline text
    -- RenderMarkdownLink            { }, -- Image & hyperlink icons
    -- RenderMarkdownWikiLink        { }, -- WikiLink icon & text
    -- RenderMarkdownUnchecked       { }, -- Unchecked checkbox
    -- RenderMarkdownChecked         { }, -- Checked checkbox
    -- RenderMarkdownTodo            { }, -- Todo custom checkbox
    -- RenderMarkdownTableHead       { }, -- Pipe table heading row    RenderMarkdownTableRow       { }, -- Pipe table body rows
    -- RenderMarkdownTableFill       { }, -- Pipe table inline padding
    -- RenderMarkdownSuccess         { }, -- Success related calloutsts
    -- RenderMarkdownInfo            { }, -- Info related callouts
    -- RenderMarkdownHint            { }, -- Hint related callouts
    -- RenderMarkdownWarn            { }, -- Warning related callouts
    -- RenderMarkdownError           { }, -- Error related callouts

    UfoFoldedFg { fg = C.pale }, -- Foreground for raw text of folded line.
    UfoFoldedBg { bg = C.surface1 }, -- Background of folded line.
    -- UfoPreviewSbar { }, -- Scroll bar of preview window, only take effect if the border is missing right horizontal line, like border = 'none'.
    -- UfoPreviewCursorLine { }, -- Highlight current line in preview window if it isn't the start of folded lines.
    -- UfoPreviewWinBar { }, -- WinBar of preview window.
    -- UfoPreviewThumb { }, -- Thumb of preview window.
    -- UfoFoldedEllipsis { }, -- Ellipsis at the end of folded line, invalid if fold_virt_text_handler is set.
    -- UfoCursorFoldedLine { }, -- Highlight the folded line under the cursor

    MiniIconsAzure { fg = U.darken(C.cyan, 0.4, C.blue) }, -- We don't have azure in palette, let's mix one
    MiniIconsBlue   { fg = C.blue },
    MiniIconsCyan   { fg = C.cyan },
    MiniIconsGreen  { fg = C.green },
    MiniIconsGray   { fg = C.subtext0 }, -- Use subtext0 over gray for visibility
    MiniIconsOrange { fg = C.orange },
    MiniIconsPurple { fg = C.purple },
    MiniIconsRed    { fg = C.red },
    MiniIconsYellow { fg = C.gold }, -- gold generaly blends better. Use yellow only for warning highlights
  }
end)

return theme
