-- https://github.com/MeanderingProgrammer/render-markdown.nvim#colors

return {
  RenderMarkdownH1 = { fg = C.red },
  RenderMarkdownH2 = { fg = C.orange },
  RenderMarkdownH3 = { fg = C.yellow },
  RenderMarkdownH4 = { fg = C.green },
  RenderMarkdownH5 = { fg = C.cyan },
  RenderMarkdownH6 = { fg = C.blue },
  RenderMarkdownH1Bg = { bg = U.darken(C.red, 0.3) },
  RenderMarkdownH2Bg = { bg = U.darken(C.orange, 0.3) },
  RenderMarkdownH3Bg = { bg = U.darken(C.yellow, 0.3) },
  RenderMarkdownH4Bg = { bg = U.darken(C.green, 0.3) },
  RenderMarkdownH5Bg = { bg = U.darken(C.cyan, 0.3) },
  RenderMarkdownH6Bg = { bg = U.darken(C.blue, 0.3) },
  RenderMarkdownCode = { bg = C.solid },
  RenderMarkdownBullet = { link = "Special" },
}
