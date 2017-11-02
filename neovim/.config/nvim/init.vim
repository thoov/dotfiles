set nocompatible
filetype off

call plug#begin('~/.local/share/nvim/plugged')
Plug 'mhinz/vim-grepper'
Plug 'mhartington/oceanic-next'
Plug 'airblade/vim-gitgutter'
Plug 'kshenoy/vim-signature'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'mustache/vim-mustache-handlebars'
Plug 'leafgarland/typescript-vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'tpope/vim-markdown'
Plug 'othree/html5.vim'
Plug 'elzr/vim-json'
Plug 'w0rp/ale'
Plug 'editorconfig/editorconfig-vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'Yggdroot/indentLine'
Plug 'Raimondi/delimitmate'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-scripts/Align'
Plug 'Shougo/deoplete.nvim'
Plug 'ervandew/supertab'
Plug 'kien/ctrlp.vim'
call plug#end()
filetype plugin indent on

let mapleader = ','

" Remap Ctrl-hjkl to move to different panes
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" ,l aligns the block
noremap <leader>l :Align

" ,g toogles git markings
nnoremap <leader>g :GitGutterToggle<CR>

" ,m toogles markers
nnoremap <leader>m :SignatureToggleSigns<CR>

" ,b searches open buffers
nnoremap <leader>b :CtrlPBuffer<CR>

" ,d toogles nerd tree
nnoremap <leader>d :NERDTreeToggle<CR>

" ,f opens the current buffer's location in nerd tree
nnoremap <leader>f :NERDTreeFind<CR>
nnoremap <leader>t :CtrlPCurWD<CR>
nnoremap <leader>T :CtrlPClearCache<CR>:CtrlP<CR>

nnoremap <leader>a :Grepper -highlight -tool rg<CR>
nnoremap <leader>s :GrepperRg<Space>
inoremap jj <ESC>

" Spaces & Tab settings
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" UI Config
set relativenumber number
set showcmd
set cursorline
set wildmenu
set wildignore=log/**,node_modules/**,bower_components/**,target/**,tmp/**,*/.git/*,*/tmp/*,*.swp
set wildmode=longest,list,full
set lazyredraw
set showmatch

set autoindent
set encoding=utf8
set ignorecase
set smartcase
set directory-=.

" reload files when changed on disk, i.e. via `git checkout`
set autoread

" don't bother with vi compatibility
set nocompatible

let g:NERDSpaceDelims = 1
let g:ctrlp_match_window = 'order:ttb,max:20'


" keep section highlighed when indenting
vmap < <gv
vmap > >gv

" theme settings
syntax enable
set background=dark
hi StatusLine gui=NONE

" TODO: figure out these settings
hi vertsplit ctermfg=238 ctermbg=235
hi LineNr ctermfg=237
hi StatusLineNC ctermfg=235 ctermbg=237
hi Search ctermbg=58 ctermfg=15
hi Default ctermfg=1
hi clear SignColumn
hi SignColumn ctermbg=235
hi GitGutterAdd ctermbg=235 ctermfg=245
hi GitGutterChange ctermbg=235 ctermfg=245
hi GitGutterDelete ctermbg=235 ctermfg=245
hi GitGutterChangeDelete ctermbg=235 ctermfg=245
hi EndOfBuffer ctermfg=237 ctermbg=235

set statusline=%=%f\ %m
" set fillchars=vert:\ ,stl:\ ,stlnc:\ " this is causing ////// on the
" statusline
set laststatus=2
set noshowmode

if (has('termguicolors'))
 set termguicolors
endif

" show trailing whitespace
set list
set listchars=tab:▸\ ,trail:▫

" show where you are
set ruler

set scrolloff=3 " show context above/below cursorline

" Don't copy the contents of an overwritten selection.
vnoremap p "_d

" allow non .jsx to have jsx stuff
let g:jsx_ext_required = 0

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" Enable persistent undo even after closing the file
set undodir=~/.config/nvim/undodir
set undofile

let g:NERDTreeShowHidden=1

" tell delimitmate to insert a newline on expand
let delimitMate_expand_cr=1

" remove whitespace from eol on write
autocmd BufWritePre * :%s/\s\+$//e

" pangloss/vim-javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_conceal_function = "ƒ"

" mustache/vim-mustache-handlebars
let g:mustache_abbreviations = 1

" elzr/vim-json
let g:vim_json_syntax_conceal = 0

" Yggdroot/indentLine
let g:indentLine_char = '¦'
let g:indentLine_color_term = 239

" Shougo/deoplete.nvim
let g:deoplete#enable_at_startup = 1

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

