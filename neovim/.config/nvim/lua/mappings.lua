local function map(mode, lhs, rhs, opts) 
  local options = {noremap = true} 
  if opts then 
    options = vim.tbl_extend('force', options, opts) 
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.g.mapleader = ','

map('i', 'jj', '<ESC>')

map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

map('n', '<leader>v', ':vsplit<CR><C-w>l')
map('n', '<leader>h', ':split<CR><C-w>j')

-- Resize with arrows
map("n", "<C-Up>", ":resize -2<CR>")
map("n", "<C-Down>", ":resize +2<CR>")
map("n", "<C-Left>", ":vertical resize -2<CR>")
map("n", "<C-Right>", ":vertical resize +2<CR>")

-- Shift + J/K moves selected lines down/up in visual mode
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Stay in indent mode
map("v", "<", "<gv")
map("v", ">", ">gv")

map('n', '<esc>', ':nohlsearch<return><esc>')

map('n', '<leader>d', '<cmd>NvimTreeFindFileToggle<cr>')
map('n', '<leader>t', '<cmd>lua require("telescope.builtin").find_files({ hidden = true })<cr>')
map('n', '<leader>b', '<cmd>lua require("telescope.builtin").buffers({ sort_mru = true, ignore_current_buffer = true })<cr>')
map('n', '<leader>r', '<cmd>lua require("telescope.builtin").registers()<cr>')
map('n', '<leader>s', '<cmd>lua require("telescope.builtin").live_grep()<cr>')
map('n', '<leader>cr', '<cmd>lua require("telescope.builtin").lsp_references()<cr>')
map('n', '<leader>gs', '<cmd>lua require("telescope.builtin").git_status()<cr>') 
map('n', '<leader>e', '<cmd>lua require("telescope.builtin").resume()<cr>') 

-- map('n', '<leader>qf', '<cmd>cope<cr>') 
map('n', '<leader>qf', '<cmd>lua require("telescope.builtin").quickfix()<cr>') 

