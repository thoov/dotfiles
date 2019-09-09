set nocompatible

call plug#begin('~/.local/share/nvim/plugged')
" Linting
Plug 'dense-analysis/ale'

" Syntax
Plug 'joukevandermaas/vim-ember-hbs'
Plug 'sheerun/vim-polyglot'

" CoC
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

" Themes / Colors
Plug 'ntk148v/vim-horizon'
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'

Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'google/vim-searchindex'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'nelstrom/vim-visual-star-search'
Plug 'rhysd/clever-f.vim'
Plug 'machakann/vim-sandwich'
call plug#end()

filetype plugin indent on
let mapleader = ','

"
" Remaps
"
inoremap jj <ESC>
nnoremap <leader>g :GitGutterToggle<CR>
nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>
nnoremap <leader>a :Files<CR>
nnoremap <leader>t :GFiles<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>s :Rg<CR>
nnoremap <leader>i :vsplit $HOME/.config/nvim/init.vim<CR>
nnoremap <leader>r :source $HOME/.config/nvim/init.vim<CR>

" Split plane and make the new one active
nnoremap <leader>v :vsplit<CR><C-w>l
nnoremap <leader>h :split<CR><C-w>j

" Remap Ctrl-hjkl to move to different panes
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Make resizing use sane values
nnoremap <silent> + :resize +10<CR>
nnoremap <silent> - :resize -10<CR>
nnoremap <silent> < :vertical resize +10<CR>
nnoremap <silent> > :vertical resize -10<CR>

inoremap <tab> <c-r>=InsertTabWrapper()<cr>
" This unsets the "last search pattern" register by hitting return
nnoremap <esc> :nohlsearch<return><esc>
" When selecting a word with * stay on the word under the cursor instead of
" jumping to the next occurrence
nnoremap * *``
tnoremap <Esc> <C-\><C-n>

set relativenumber number
set wildmenu
set wildignore=log/**,node_modules/**,bower_components/**,target/**,tmp/**,*/.git/*,*/tmp/*,*.swp
set wildmode=longest,list,full
set lazyredraw
set autoindent
set encoding=utf8
set ignorecase
set smartcase
set directory-=.
set cursorline
set autoread
set clipboard=unnamed
set inccommand=nosplit
set noshowmode
" show trailing whitespace
set list
set listchars=tab:▸\ ,trail:▫
" Enable persistent undo even after closing the file
set undodir=/tmp/undodir
set undofile

filetype plugin indent on
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" keep section highlighed when indenting
vmap < <gv
vmap > >gv

" Shougo/deoplete.nvim
" let g:deoplete#enable_at_startup = 1

" Smart tab completion which allows tab to be pressed at the
" beginning of the line or when not after a character but still
" allows autocompletion
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction

"
" COLORS
"
syntax on
set termguicolors
colorscheme onedark

" use the terminals "background" color
hi Normal ctermbg=NONE guibg=NONE
hi LineNr ctermbg=NONE guibg=NONE
hi EndOfBuffer NONE

set laststatus=2

function! GitBranch()
  let l:branchname = system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
  return strlen(l:branchname) > 0 ? '  '.l:branchname : ''
endfunction

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

"
" Make non active buffer less pronounced
"
augroup BgHighlight
    autocmd!
    autocmd WinEnter * set relativenumber
    autocmd WinLeave * set norelativenumber
augroup END

augroup ReloadVimInit
    autocmd!
    autocmd bufwritepost init.vim source ~/.dotfiles/neovim/.config/nvim/init.vim
augroup END

" Turn the cursor back to a vertical line when exiting vim
au VimLeave * set guicursor=a:ver100-blinkon0

"
" FZF
"
let g:fzf_layout = { 'down': '~30%' }

"
" ALE
"
let g:ale_linters = {
\   'javascript': ['eslint'],
\}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier', 'eslint'],
\}

" Go to next or previous lint error
nmap <silent> <C-n> <Plug>(ale_previous_wrap)
nmap <silent> <C-N> <Plug>(ale_next_wrap)

" Set this variable to 1 to fix files when you save them.
" let g:ale_fix_on_save = 1
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
highlight ALEErrorSign ctermbg=NONE ctermfg=RED guifg=RED
highlight ALEWarningSign ctermbg=NONE ctermfg=YELLOW guifg=YELLOW

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Add diagnostic info for https://github.com/itchyny/lightline.vim
let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status'
      \ },
      \ }

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
  \ 'coc-json'
  \ ]

nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
