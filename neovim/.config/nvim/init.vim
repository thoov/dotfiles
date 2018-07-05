call plug#begin('~/.local/share/nvim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'kshenoy/vim-signature'
Plug 'Yggdroot/indentLine'
Plug 'Raimondi/delimitmate'
Plug 'editorconfig/editorconfig-vim'
Plug 'scrooloose/nerdtree'
Plug 'Shougo/deoplete.nvim'
Plug 'machakann/vim-highlightedyank'
Plug 'milkypostman/vim-togglelist'
" the good stuff
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

" languages
Plug 'w0rp/ale'
Plug 'pangloss/vim-javascript'
Plug 'mustache/vim-mustache-handlebars'
Plug 'leafgarland/typescript-vim'

" one colorscheme pack to rule them all!
Plug 'flazz/vim-colorschemes'

" display number of search matches & index of a current match
Plug 'google/vim-searchindex'

" Project wide searching (sublime-like)
Plug 'dyng/ctrlsf.vim'
Plug 'mhinz/vim-grepper' " TODO: do I still need this?

" FZF searching for files, buffers, etc
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
call plug#end()

set nocompatible
filetype plugin indent on
let mapleader = ','

"
"
" Remaps
"
"
inoremap jj <ESC>

nnoremap <leader>g :GitGutterToggle<CR>
nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>
nnoremap <leader>s :GrepperRg<Space>

nnoremap <leader>t :GFiles<CR>
nnoremap <leader>a :Files<CR>
nnoremap <leader>b :Buffers<CR>

" Remap Ctrl-hjkl to move to different panes
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Split plane and make the new one active
nnoremap <leader>v :vsplit<CR><C-w>l
nnoremap <leader>h :split<CR><C-w>j

" Go to next or previous lint error
nmap <silent> <C-n> <Plug>(ale_previous_wrap)
nmap <silent> <C-p> <Plug>(ale_next_wrap)

" UI Config
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

" keep section highlighed when indenting
vmap < <gv
vmap > >gv

set noshowmode

" show trailing whitespace
set list
set listchars=tab:▸\ ,trail:▫

" Enable persistent undo even after closing the file
set undodir=/tmp/undodir
set undofile

" remove whitespace from eol on write

" Yggdroot/indentLine
let g:indentLine_char = '¦'
let g:indentLine_color_term = 239

" Shougo/deoplete.nvim
let g:deoplete#enable_at_startup = 1

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

inoremap <tab> <c-r>=InsertTabWrapper()<cr>

if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif

" This unsets the "last search pattern" register by hitting return
" nnoremap <silent> <CR> :nohlsearch<CR>
nnoremap <esc> :nohlsearch<return><esc>

set clipboard=unnamed

augroup myvimrchooks
    au!
    autocmd bufwritepost init.vim source ~/.dotfiles/neovim/.config/nvim/init.vim

    " Jump to last cursor position unless it's invalid or in an event handler
    autocmd BufReadPost *
          \ if line("'\"") > 0 && line("'\"") <= line("$") |
          \   exe "normal g`\"" |
          \ endif
augroup END

" Disable ale lint warnings from being highlighted
let g:ale_set_highlights = 0

set inccommand=nosplit

" Turn the cursor back to a vertical line when exiting vim
au VimLeave * set guicursor=a:ver100-blinkon0

set cursorline

" If a file is changed outside of vim, automatically reload it without asking
set autoread

" When selecting a word with * stay on the word under the cursor instead of
" jumping to the next occurrence
nnoremap * *``

let g:javascript_plugin_flow = 1

"
"
" COLORS
"
"
syntax on

hi CursorLine cterm=BOLD ctermbg=235 ctermfg=NONE
hi CursorColumn cterm=NONE ctermbg=DarkGreen ctermfg=NONE
hi Cursor cterm=NONE ctermfg=white ctermbg=black
hi Search ctermbg=240 ctermfg=NONE cterm=BOLD,UNDERLINE
hi Visual ctermbg=237 ctermfg=NONE

"
"
" STATUS LINE
"
" https://hackernoon.com/the-last-statusline-for-vim-a613048959b2
" http://got-ravings.blogspot.com/2008/08/vim-pr0n-making-statuslines-that-own.html
" https://gabri.me/blog/diy-vim-statusline/
"
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
"
" NERDTree
"
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

"
" CTRLSF
"
let g:ctrlsf_search_mode = 'async'
let g:ctrlsf_winsize = '35%'

"
" FZF
"
let g:fzf_layout = { 'down': '~25%' }
