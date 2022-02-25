local nightfox = require('nightfox')
local colors = require('nightfox.colors').init('nightfox')

-- 
-- https://github.com/EdenEast/nightfox.nvim
--
nightfox.setup({
  fox = 'nightfox',
  transparent = true,
  alt_nc = true,
  inverse = {
    match_paren = true,
  },
  hlgroups = {
    DiagnosticSignError = { fg = colors.error },
    DiagnosticSignInfo = { fg = colors.info },
    DiagnosticSignHint = { fg = colors.hint },
    DiagnosticSignWarn = { fg = colors.warning },

    DiagnosticVirtualTextError = { bg = 'none' },
    DiagnosticFloatingHint = { fg = colors.hint }, 
    DiagnosticVirtualTextInfo = { fg = colors.info },
    DiagnosticVirtualTextWarn = { fg = colors.warning },
    NvimTreeNormal = { bg = 'NONE' },

    FidgetTitle = { bg = 'NONE' },
    FidgetTask = { bg = 'NONE' },

    -- TelescopeBorder = { fg = colors.white, bg = colors.white },
    -- TelescopePromptBorder = { fg = colors.red, bg = colors.red }

    -- fg_bg("TelescopeBorder", darker_black, darker_black)
    -- fg_bg("TelescopePromptBorder", black2, black2)
    -- fg_bg("TelescopePromptNormal", white, black2)
    -- fg_bg("TelescopePromptPrefix", red, black2)
    -- bg("TelescopeNormal", darker_black)
    -- fg_bg("TelescopePreviewTitle", black, green)
    -- fg_bg("TelescopePromptTitle", black, red)
    -- fg_bg("TelescopeResultsTitle", darker_black, darker_black)
    -- bg("TelescopeSelection", black2)
  },
})

nightfox.load()

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

