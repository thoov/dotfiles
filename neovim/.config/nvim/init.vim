if 0 | endif

if has('vim_starting')
  if &compatible
    set nocompatible " Be iMproved
  endif

  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

" Theme plugins
NeoBundle 'mhartington/oceanic-next'

" Git plugins
NeoBundle 'Xuyuanp/nerdtree-git-plugin'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'tpope/Vim-fugitive'

" Gutter plugins
NeoBundle 'kshenoy/vim-signature'

" Language plugins
NeoBundle 'mxw/vim-jsx'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'mustache/vim-mustache-handlebars'
NeoBundle 'leafgarland/typescript-vim'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'othree/html5.vim'
NeoBundle 'elzr/vim-json'
NeoBundle 'rust-lang/rust.vim'

" Startup plugins
NeoBundle 'mhinz/vim-startify'
NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'scrooloose/nerdtree'

" Text / Movement plugins
NeoBundle 'tpope/vim-surround'
NeoBundle 'easymotion/vim-easymotion'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'Tpope/vim-commentary'
NeoBundle 'Raimondi/delimitmate'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'vim-scripts/Align'

" Search plugins
NeoBundle 'haya14busa/incsearch.vim'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'kien/ctrlp.vim'

" Autocomplete plugins
NeoBundle 'ervandew/supertab'
NeoBundle 'Shougo/deoplete.nvim'

" Lint plugins
NeoBundle 'benekastah/neomake'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

let mapleader = ','
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <leader>l :Align
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>
nnoremap <leader>t :CtrlPCurWD<CR>
nnoremap <leader>T :CtrlPClearCache<CR>:CtrlP<CR>
nnoremap <leader>g :GitGutterToggle<CR>
nnoremap <leader>a :Ack<SPACE>
nnoremap <leader>tm :SignatureToggle<CR>
inoremap jj <ESC>

" tab settings
set shiftwidth=2
set softtabstop=2

" turn on the number guide and set it to relative
set relativenumber number

set autoindent
set encoding=utf8
set expandtab
set ignorecase
set incsearch
set showcmd
set smartcase
set directory-=.
set cursorline
set guifont=Inconsolata\ for\ Powerline:h13

" reload files when changed on disk, i.e. via `git checkout`
set autoread

" don't bother with vi compatibility
set nocompatible

let g:NERDSpaceDelims = 1
let g:ctrlp_match_window = 'order:ttb,max:20'

set wildmenu
set wildignore=log/**,node_modules/**,bower_components/**,target/**,tmp/**
set wildmode=longest,list,full

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
set fillchars=vert:\ ,stl:\ ,stlnc:\
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

" Disambiguate ,a & ,t from the Align plugin, making them fast again.
"
" This section is here to prevent AlignMaps from adding a bunch of mappings
" that interfere with the very-common ,a and ,t mappings. This will get run
" at every startup to remove the AlignMaps for the *next* vim startup.
"
" If you do want the AlignMaps mappings, remove this section, remove
" ~/.vim/bundle/Align, and re-run rake in maximum-awesome.
function! s:RemoveConflictingAlignMaps()
  if exists("g:loaded_AlignMapsPlugin")
    AlignMapsClean
  endif
endfunction
command! -nargs=0 RemoveConflictingAlignMaps call s:RemoveConflictingAlignMaps()
silent! autocmd VimEnter * RemoveConflictingAlignMaps


" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" Enable persistent undo even after closing the file
set undodir=~/.config/nvim/undodir
set undofile

let g:NERDTreeShowHidden=1
let g:neomake_javascript_enabled_makers = ['eslint']

autocmd BufWritePost,BufEnter * Neomake

let g:neomake_warning_sign = {
  \ 'text': 'W',
  \ 'texthl': 'WarningMsg',
  \ }

let g:neomake_error_sign = {
  \ 'text': 'E',
  \ 'texthl': 'ErrorMsg',
  \ }

" tell delimitmate to insert a newline on expand
let delimitMate_expand_cr=1

" remove whitespace from eol on write
autocmd BufWritePre * :%s/\s\+$//e

" Clear highlighting on escape in normal mode
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[

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

" haya14busa/incsearch.vim
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" Shougo/deoplete.nvim
let g:deoplete#enable_at_startup = 1

if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif

set wildignore+=*/.git/*,*/tmp/*,*.swp

let g:ackprg = 'rg --vimgrep --column --line-number --no-heading --fixed-strings --ignore-case --follow --glob "!.git/*"'

