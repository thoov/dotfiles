set nocompatible

call plug#begin('~/.local/share/nvim/plugged')
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'w0rp/ale'
Plug 'google/vim-searchindex'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'

Plug 'rakr/vim-one'
Plug 'nelstrom/vim-visual-star-search'
Plug 'rhysd/clever-f.vim'
Plug 'machakann/vim-sandwich'
Plug 'TaDaa/vimade'
call plug#end()

filetype plugin indent on
let mapleader = ','

colorscheme one

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
" Split plane and make the new one active
nnoremap <leader>v :vsplit<CR><C-w>l
nnoremap <leader>h :split<CR><C-w>j
" Remap Ctrl-hjkl to move to different panes
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
" Make resizing use sane values
nnoremap <silent> + :resize +5<CR>
nnoremap <silent> - :resize -5<CR>
nnoremap <silent> < :vertical resize +5<CR>
nnoremap <silent> > :vertical resize -5<CR>
" Go to next or previous lint error
nmap <silent> <C-n> <Plug>(ale_previous_wrap)
nmap <silent> <C-p> <Plug>(ale_next_wrap)
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
" This unsets the "last search pattern" register by hitting return
nnoremap <esc> :nohlsearch<return><esc>
" When selecting a word with * stay on the word under the cursor instead of
" jumping to the next occurrence
nnoremap * *``

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

" colorscheme OceanicNext
colorscheme one

" use the terminals "background" color
hi Normal ctermbg=NONE

hi CursorLine ctermbg=237 ctermfg=NONE
hi CursorColumn cterm=NONE ctermbg=DarkGreen ctermfg=NONE
hi Cursor cterm=NONE ctermfg=white ctermbg=black
hi Search ctermbg=240 ctermfg=NONE cterm=BOLD,UNDERLINE
hi Visual ctermbg=237 ctermfg=NONE

hi SignColumn ctermbg=NONE
hi GitGutterAdd ctermbg=NONE
hi GitGutterChange ctermbg=NONE
hi GitGutterDelete ctermbg=NONE
hi GitGutterChangeDelete ctermbg=NONE
hi EndOfBuffer NONE

hi Pmenu ctermbg=gray guibg=gray
"
" STATUS LINE
"
" https://hackernoon.com/the-last-statusline-for-vim-a613048959b2
" http://got-ravings.blogspot.com/2008/08/vim-pr0n-making-statuslines-that-own.html
" https://gabri.me/blog/diy-vim-statusline/
"
hi User1 ctermbg=252 ctermfg=16 guibg=green guifg=red
hi User2 ctermbg=NONE ctermfg=blue guibg=red guifg=blue
hi User3 ctermbg=blue ctermfg=green guibg=blue guifg=green

let g:currentmode={
    \ 'n'  : 'N ',
    \ 'no' : 'N·Operator Pending ',
    \ 'v'  : 'V ',
    \ 'V'  : 'V·Line ',
    \ '^V' : 'V·Block ',
    \ 's'  : 'Select ',
    \ 'S'  : 'S·Line ',
    \ '^S' : 'S·Block ',
    \ 'i'  : 'I ',
    \ 'R'  : 'R ',
    \ 'Rv' : 'V·Replace ',
    \ 'c'  : 'Command ',
    \ 'cv' : 'Vim Ex ',
    \ 'ce' : 'Ex ',
    \ 'r'  : 'Prompt ',
    \ 'rm' : 'More ',
    \ 'r?' : 'Confirm ',
    \ '!'  : 'Shell ',
    \ 't'  : 'Terminal '
    \}

set laststatus=2
set statusline=
set statusline+=%1*\ %{toupper(g:currentmode[mode()])}   " Current mode
set statusline+=%2*  "switch to User1 highlight
set statusline+=\ %f\    "full filename
set statusline+=%m
set statusline+=%=
" set statusline+=%3*  "switch to User2 highlight
set statusline+=%{GitBranch()}
set statusline+=\ %2*  "switch to User2 highlight

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
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace']
\}

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
hi default CocHighlightText  cterm=UNDERLINE,BOLD
