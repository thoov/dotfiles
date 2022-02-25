local _scrollbar, scrollbar = pcall(require, "scrollbar")
if not _scrollbar then
	return
end

local colors = require('nightfox.colors').init('nightfox')
local handle = { text = " ", color = colors.black_dm }
local marks = {
	Error = { color = "red" },
	Info = { color = "blue" },
	Hint = { color = "green" },
	Warn = { color = "yellow" },
	Misc = { color = "purple" },
	Search = { color = "orange" },
}

handle.color = colors.black4
marks.Hint.color = colors.sky
marks.Info.color = colors.teal
marks.Error.color = colors.red
marks.Warn.color = colors.yellow
marks.Search.color = colors.blue
marks.Misc.color = colors.green

scrollbar.setup({
	marks = marks,
	handle = handle,
  handlers = {
    diagnostic = true,
  },
  hide_if_all_visible = true, -- Hides handle if all lines are visible
	excluded_filetypes = { "nvimtree", "NvimTree", "TelescopePrompt", "prompt" },
})
