local lualine = require('lualine')
local colors = require('nightfox.colors').init('nightfox')

local function custom_location()
  local r, c = unpack(vim.api.nvim_win_get_cursor(0))

  return string.format(" %s  %s", r, c)
end

lualine.setup({
  options = {
    theme = 'nightfox',
    section_separators = { left = "", right = "" },
    component_separators = { left = "", right = "" },
    icons_enabled = true,
  },
  sections = {
    lualine_a = {{ "mode", upper = true }},
    lualine_b = {{ "branch", icon = "" }},
    lualine_c = {{'filename',
      file_status = true,  -- displays file status (readonly status, modified status)
      path = 1,            -- 0 = just filename, 1 = relative path, 2 = absolute path
      shorting_target = 40 -- Shortens path to leave 40 space in the window
    }},
    lualine_x = {"filetype"},
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

