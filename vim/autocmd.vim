if has('autocmd')
    augroup omnicomplete
        autocmd!
        if exists('+omnifunc')
            autocmd FileType python
                        \ setlocal omnifunc=pythoncomplete#Complete
            autocmd FileType html
                        \ setlocal omnifunc=htmlcomplete#CompleteTags
            autocmd FileType css
                        \ setlocal omnifunc=csscomplete#CompleteCSS
            autocmd FileType xml
                        \ setlocal omnifunc=xmlcomplete#CompleteTags
            autocmd FileType php
                        \ setlocal omnifunc=phpcomplete#CompletePHP
            autocmd FileType c,cpp
                        \ setlocal omnifunc=ccomplete#Complete
            autocmd FileType ruby
                        \ setlocal omnifunc=rubycomplete#Complete
            autocmd FileType perl
                        \ setlocal omnifunc=PerlComplete

            "if !filereadable(getcwd().'/.tern-project')
            "    autocmd FileType javascript
            "                \ setlocal omnifunc=javascriptcomplete#CompleteJS
            "else
                autocmd FileType javascript
                            \ setlocal omnifunc=tern#Complete
            "endif

            autocmd Filetype * if &omnifunc == '' |
                        \ setlocal omnifunc=syntaxcomplete#Complete |
                        \ endif
        endif
    augroup END
endif
