--
-- https://github.com/lukas-reineke/indent-blankline.nvim
--
require('indent_blankline').setup({
  char = '▏',
  filetype_exclude = {
    "help",
    "terminal",
    "dashboard",
    "packer",
    "lspinfo",
    "TelescopePrompt",
    "TelescopeResults",
  },
  buftype_exclude = { "terminal" },
  show_first_indent_level = false,
})
