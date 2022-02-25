function is_dir(path)
    f = io.open(path)
    return not f:read(0) and f:seek("end") ~= 0
end

function _G.find_files_in_directory(node)
  local utils = require'nvim-tree.utils'
  local lib = require'nvim-tree.lib'
  local node = lib.get_node_at_cursor()
  if not node then return end

  local path = node.absolute_path

  if not is_dir(path) then
    path = node.absolute_path:match("(.*)"..utils.path_separator)
  end

  local relative_path = utils.path_relative(path, vim.fn.getcwd())

  if path == vim.fn.getcwd() then
    relative_path = "/"
  end

  require("telescope.builtin").live_grep({ cwd = path, prompt_title = "Find In Directory: " .. relative_path  })
end

--
-- nvim-tree
--
-- vim.cmd[[let g:nvim_tree_quit_on_open = 1]]

require'nvim-tree'.setup {
  auto_close = true,
  update_to_buf_dir = {
    enable = true,
    auto_open = true,
  },
  git = {
    ignore = false,
  },
  view = {
    mappings = {
      list = {
        { key = "f", cb = ":lua find_files_in_directory()<cr>", mode = "n"}
      }
    }
  }
}
