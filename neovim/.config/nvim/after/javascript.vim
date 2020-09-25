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
