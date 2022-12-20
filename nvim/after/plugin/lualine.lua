local lualine = require('lualine')

local function custom_location()
  local r, c = unpack(vim.api.nvim_win_get_cursor(0))
  return string.format(" %s  %s", r, c)
end

local p = require('rose-pine.palette')

lualine.setup({
  options = {
    theme = {
      normal = {
        a = { bg = p.rose, fg = p.base, gui = 'bold' },
        b = { bg = p.overlay, fg = p.rose },
        c = { bg = "none", fg = p.text },
      },
      insert = {
        a = { bg = p.foam, fg = p.base, gui = 'bold' },
        b = { bg = p.overlay, fg = p.foam },
        c = { bg = "none", fg = p.text },
      },
      visual = {
        a = { bg = p.iris, fg = p.base, gui = 'bold' },
        b = { bg = p.overlay, fg = p.iris },
        c = { bg = "none", fg = p.text },
      },
      replace = {
        a = { bg = p.pine, fg = p.base, gui = 'bold' },
        b = { bg = p.overlay, fg = p.pine },
        c = { bg = "none", fg = p.text },
      },
      command = {
        a = { bg = p.love, fg = p.base, gui = 'bold' },
        b = { bg = p.overlay, fg = p.love },
        c = { bg = "none", fg = p.text },
      },
      inactive = {
        a = { bg = "none", fg = p.muted, gui = 'bold' },
        b = { bg = "none", fg = p.muted },
        c = { bg = "none", fg = p.muted },
      },
    },
    section_separators = { left = "", right = "" },
    component_separators = { left = "", right = "" },
    icons_enabled = true,
    disabled_filetypes = { 'packer', 'NvimTree' }
  },
  sections = {
    lualine_a = {{ "mode", upper = true }},
    lualine_b = {{ "branch", icon = "" }},
    lualine_c = {{'filename',
      file_status = true,  -- displays file status (readonly status, modified status)
      path = 1,            -- 0 = just filename, 1 = relative path, 2 = absolute path
      shorting_target = 40 -- Shortens path to leave 40 space in the window
    }},
    lualine_x = {},
    lualine_y = {{"diagnostics", sources = {"nvim_diagnostic"}, symbols = {error = " ", warn = " ", info = " "}, padding = { left = 0, right = 1 }}},
    lualine_z = {{custom_location, padding = { left = 0, right = 1 }}}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  extensions = { { sections = { lualine_b = { "filetype" } }, filetypes = { "NvimTree" } } },
})

