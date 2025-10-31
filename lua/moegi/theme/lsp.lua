local lush, U, C, c = require("moegi")._init()

-- stylua: ignore
---@diagnostic disable: undefined-global
local lsp = lush(function(injected_functions)
  return {
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
    -- DiagnosticVirtualTextError  { } , -- Used for "Error" diagnostic virtual text.
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
  }
end)

return lsp
