-- stylua: ignore
return {
  -- See :h treesitter-highlight-groups
  ["@variable"]                    = { fg = C.pale },
  ["@type.builtin.cpp"]            = { fg = C.pink, gui = O.keyword_gui },
  ["@markup.strong"]               = { fg = C.pale, gui = { "bold" } },
  ["@markup.italic"]               = { fg = C.pale, gui = { "italic" } },

  ["@markup.heading.1.markdown"]   = { fg = C.red },
  ["@markup.heading.2.markdown"]   = { fg = C.orange },
  ["@markup.heading.3.markdown"]   = { fg = C.yellow },
  ["@markup.heading.4.markdown"]   = { fg = C.green },
  ["@markup.heading.5.markdown"]   = { fg = C.cyan },
  ["@markup.heading.6.markdown"]   = { fg = C.blue },
}
