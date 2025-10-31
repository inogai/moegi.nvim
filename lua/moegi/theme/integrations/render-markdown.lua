local lush, U, C, c = require("moegi")._init()
-- https://github.com/MeanderingProgrammer/render-markdown.nvim#colors

-- stylua: ignore
---@diagnostic disable: undefined-global
return lush.extends({ require("moegi.theme.base") }).with(function(injected_functions)
  return {
    RenderMarkdownH1              { rainbow1 }, -- H1 icons
    RenderMarkdownH2              { rainbow2 }, -- H2 icons
    RenderMarkdownH3              { rainbow3 }, -- H3 icons
    RenderMarkdownH4              { rainbow4 }, -- H4 icons
    RenderMarkdownH5              { rainbow5 }, -- H5 icons
    RenderMarkdownH6              { rainbow6 }, -- H6 icons
    RenderMarkdownH1Bg            { bg = U.darken(C.red, 0.3) }, -- H1 background line
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

  }
end)
