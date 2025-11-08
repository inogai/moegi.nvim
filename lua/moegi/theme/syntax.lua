return {
  -- See :h group-name.
  Comment    = { fg = C.muted },                      -- Any comment

  Constant   = { fg = C.pale, gui = O.constant_gui }, -- (*) Any constant
  String     = { fg = C.mint, gui = O.string_gui },   --   A string constant: "this is a string"
  Character  = { fg = C.mint, gui = O.string_gui },   --   A character constant: 'c', '\n'
  Number     = { fg = C.gold, gui = O.keyword_gui },  --   A number constant: 234, 0xff
  Boolean    = { fg = C.gold, gui = O.keyword_gui },  --   A boolean constant: TRUE, false
  -- Float         = { }, --   A floating point constant: 2.3e10

  Identifier = { fg = C.pale },                      -- (*) Any variable name
  Function   = { fg = C.cyan },                      --   Function name (also: methods for classes)

  Statement  = { fg = C.pink, gui = O.keyword_gui }, -- (*) Any statement
  -- Conditional    = { }, --   if, then, else, endif, switch, etc.
  -- Repeat         = { }, --   for, do, while, etc.
  -- Label          = { }, --   case, default, etc.
  Operator   = { fg = C.pink }, --   "sizeof", "+", "*", etc.
  -- Keyword        = { }, --   any other keyword
  -- Exception      = { }, --   try, catch, throw

  PreProc    = { fg = C.cyan }, -- (*) Generic Preprocessor
  -- Include        = { }, --   Preprocessor #include
  -- Define         = { }, --   Preprocessor #define
  -- Macro          = { }, --   Same as Define
  -- PreCondit      = { }, --   Preprocessor #if, #else, #endif, etc.

  Type       = { fg = C.orange }, -- (*) int, long, char, etc.
  -- StorageClass   = { }, --   static, register, volatile, etc.
  -- Structure      = { }, --   struct, union, enum, etc.
  -- Typedef        = { }, --   A typedef

  Special    = { fg = C.cyan }, -- (*) Any special symbol
  -- SpecialChar    = { }, --   Special character in a constant
  -- Tag            = { }, --   You can use CTRL-] on this
  Delimiter  = { fg = C.muted }, --   Character that needs attention
  -- SpecialComment = { }, --   Special things inside a comment (e.g. '\n')
  -- Debug          = { }, --   Debugging statements

  -- Underlined     = { gui = "underline" }, -- Text that stands out, HTML links
  -- Ignore         = { }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
  -- Error          = { }, -- Any erroneous construct
  -- Todo           = { }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX
}
