local lush, U, C, c = require("moegi")._init()

-- stylua: ignore
---@diagnostic disable: undefined-global
local treesitter = lush(function(injected_functions)
  local sym = injected_functions.sym
  return {
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
    sym"@variable"          { fg = C.pale }, -- Identifier
    -- sym"@type"              { }, -- Type
    -- sym"@type.definition"   { }, -- Typedef
    sym"@type.builtin.cpp"  { fg = C.pink, gui = c.keyword_gui }, -- Statement
    -- sym"@storageclass"      { }, -- StorageClass
    -- sym"@structure"         { }, -- Structure
    -- sym"@namespace"         { }, -- Identifier
    -- sym"@include"           { }, -- Include
    -- sym"@preproc"           { }, -- PreProc
    -- sym"@debug"             { }, -- Debug
    -- sym"@tag"               { }, -- Tag

    sym"@markup.strong"       { fg = C.pale, gui = "bold" },
    sym"@markup.italic"       { fg = C.pale, gui = "italic" },

    -- Tree-Sitter Markdown syntax groups.
    sym"@markup.heading.1.markdown" { fg = C.red },
    sym"@markup.heading.2.markdown" { fg = C.orange },
    sym"@markup.heading.3.markdown" { fg = C.yellow },
    sym"@markup.heading.4.markdown" { fg = C.green },
    sym"@markup.heading.5.markdown" { fg = C.cyan },
    sym"@markup.heading.6.markdown" { fg = C.blue },
  }
end)

return treesitter
