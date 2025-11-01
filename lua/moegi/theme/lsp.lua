---@type table<string, vim.api.keyset.highlight>
-- stylua: ignore
return {
  -- See :h lsp-highlight and :h diagnostic-highlights
  LspInlayHint                = { fg = U.vary_color({ dark = C.muted, light = C.green }), bg = U.vary_color({ dark = C.overlay1, light = C.overlay2 }) },
  LspCodeLens                 = { fg = C.muted },
  LspReferenceText            = { bg = C.overlay2 },
  DiagnosticError             = { fg = C.red },
  DiagnosticWarn              = { fg = C.yellow },
  DiagnosticInfo              = { fg = C.blue },
  DiagnosticHint              = { fg = C.cyan },
  DiagnosticOk                = { fg = C.green },
  DiagnosticUnderlineError    = { gui = O.diagnostic_underline_gui, sp = C.red },
  DiagnosticUnderlineWarn     = { gui = O.diagnostic_underline_gui, sp = C.yellow },
  DiagnosticUnderlineInfo     = { gui = O.diagnostic_underline_gui, sp = C.blue },
  DiagnosticUnderlineHint     = { gui = O.diagnostic_underline_gui, sp = C.cyan },
  DiagnosticUnderlineOk       = { gui = O.diagnostic_underline_gui, sp = C.green },
}
