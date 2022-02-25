local status_ok, configs = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
  return
end

vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'

require'nvim-treesitter.configs'.setup {
  ensure_installed = 'maintained',
  highlight = { enable = true },
  indent = { enable = true },
  fold = { enable = true },
}

