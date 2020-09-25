call plug#begin('~/.local/share/nvim/plugged')

" colorscheme
Plug 'rakr/vim-one'
Plug 'ghifarit53/tokyonight-vim'

" syntax
Plug 'pangloss/vim-javascript'
Plug 'joukevandermaas/vim-ember-hbs'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'othree/html5.vim'
Plug 'arzg/vim-sh'

" lint + language server support
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" searching
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" good stuff
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdtree'
Plug 'nelstrom/vim-visual-star-search'
Plug 'rhysd/clever-f.vim'
Plug 'machakann/vim-sandwich'
Plug 'itchyny/lightline.vim'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'tpope/vim-fugitive'

Plug '/Users/thoover/code/vim-vscode-launcher'
call plug#end()

let mapleader = ','

inoremap jj <ESC>
nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>
nnoremap <leader>a :Files<CR>
nnoremap <leader>t :GFiles<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>s :Rg<CR>
nnoremap <leader>ce :vsplit $HOME/.config/nvim/init.vim<CR>
nnoremap <leader>cs :so $HOME/.config/nvim/init.vim<CR>
nnoremap <leader>v :vsplit<CR><C-w>l
nnoremap <leader>h :split<CR><C-w>j
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
nnoremap <silent> + :resize +10<CR>
nnoremap <silent> - :resize -10<CR>
nnoremap <silent> > :vertical resize +10<CR>
nnoremap <silent> < :vertical resize -10<CR>
nnoremap <esc> :nohlsearch<return><esc>
vmap < <gv
vmap > >gv

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" filetype plugin indent on
syntax on
colorscheme one
set background=dark

set smartcase
set smarttab
set expandtab
set tabstop=2 softtabstop=2 shiftwidth=2
set number relativenumber
set lazyredraw
set encoding=utf8
set ignorecase
set directory-=.
set cursorline
set autoread
set clipboard=unnamed
set inccommand=nosplit
set noshowmode
set list
set listchars=tab:▸\ ,trail:▫
set undodir=/tmp/undodir
set undofile
set termguicolors
set hidden
set nobackup
set noswapfile
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes

hi Normal guibg=NONE

"
" NERDTree
"
let NERDTreeStatusline="%2*" " turn nerd tree's status line to NONE
let NERDTreeShowHidden=1
let NERDSpaceDelims = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeQuitOnOpen = 1

" Turn the cursor back to a vertical line when exiting vim
" Highlight symbol under cursor on CursorHold
au VimLeave * set guicursor=a:ver100-blinkon0

let g:fzf_layout = { 'down': '~30%' }
let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified'] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }
let g:javascript_plugin_jsdoc = 1

"
" ALE
"
let g:ale_linters = { 'javascript': ['eslint'] }
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier', 'eslint'],
\}
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '--'
hi ALEErrorSign ctermbg=NONE ctermfg=RED guifg=RED
hi ALEWarningSign ctermbg=NONE ctermfg=YELLOW guifg=YELLOW
nmap <silent> <C-n> <Plug>(ale_previous_wrap)
nmap <silent> <C-N> <Plug>(ale_next_wrap)

"
" CoC
"
let g:coc_global_extensions = [
  \ 'coc-ember',
  \ 'coc-tsserver',
  \ 'coc-css',
  \ 'coc-html',
  \ 'coc-rls',
  \ 'coc-yaml',
  \ 'coc-prettier',
  \ 'coc-eslint',
  \ 'coc-pairs',
  \ 'coc-json',
  \ 'coc-rls'
  \ ]
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:one_allow_italics = 1 " I love italic for comments

" Addition syntax highlighting
" TODO: move to .config/nvim/after/<file>.vim
augroup ft_js
    autocmd!
    autocmd Syntax javascript syn match requireKeyword /require\((\)\@=/ containedin=ALL
    autocmd Syntax javascript hi requireKeyword guifg=#24a2ae
augroup end

highlight Comment cterm=italic gui=italic
highlight jsFuncArgs cterm=italic gui=italic
highlight jsThis cterm=italic gui=italic
highlight jsDecorator guifg=red
highlight jsDecoratorFunction guifg=red

if (has("termguicolors"))
  set termguicolors
endif
