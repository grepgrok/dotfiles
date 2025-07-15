local function hi(group, opts)
	vim.api.nvim_set_hl(0, group, opts)
end

hi("LineNr", { fg = palette.base05, bg = palette.base00, attr = nil, sp = nil })
hi("LineNrAbove", { fg = palette.base02, bg = palette.base00, attr = nil, sp = nil })
hi("LineNrBelow", { fg = palette.base02, bg = palette.base00, attr = nil, sp = nil })

hi("MiniDiffSignAdd", { fg = palette.base0B, bg = palette.base00, attr = nil, sp = nil })
hi("MiniDiffSignChange", { fg = palette.base0E, bg = palette.base00, attr = nil, sp = nil })
hi("MiniDiffSignDelete", { fg = palette.base08, bg = palette.base00, attr = nil, sp = nil })

hi("SignColumn", { fg = palette.base03, bg = palette.base00, attr = nil, sp = nil })
hi("CursorLineNr", { fg = palette.base05, bg = nil, attr = nil, sp = nil })

hi("DiagnosticFloatingError", { fg = palette.base08, bg = palette.base00, attr = nil, sp = nil })
hi("DiagnosticFloatingHint", { fg = palette.base0D, bg = palette.base00, attr = nil, sp = nil })
hi("DiagnosticFloatingInfo", { fg = palette.base0C, bg = palette.base00, attr = nil, sp = nil })
hi("DiagnosticFloatingOk", { fg = palette.base0B, bg = palette.base00, attr = nil, sp = nil })
hi("DiagnosticFloatingWarn", { fg = palette.base0E, bg = palette.base00, attr = nil, sp = nil })

hi("MiniStatuslineDevinfo", { fg = palette.base05, bg = palette.base02, attr = nil, sp = nil })
hi("MiniStatuslineFilename", { fg = palette.base06, bg = palette.base01, attr = nil, sp = nil })
