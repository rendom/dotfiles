if has('autocmd')

    augroup fswitch
        autocmd!
        autocmd BufEnter *.h let b:fswitchdst  = 'c,cpp'
        autocmd BufEnter *.h let b:fswitchlocs = '../src,../source'

        autocmd BufEnter *.c let b:fswitchdst  = 'h'
        autocmd BufEnter *.c let b:fswitchlocs = '../src,../,../include'

        autocmd BufEnter *.hpp let b:fswitchdst  = 'cpp'
        autocmd BufEnter *.hpp let b:fswitchlocs = '../src,../source'

        autocmd BufEnter *.cpp let b:fswitchdst  = 'hpp,h'
        autocmd BufEnter *.cpp let b:fswitchlocs = '../src,../,../include'
    augroup END

    " augroup relative
    "     autocmd!
    "     autocmd BufWritePost,BufReadPre * :Neomake
    " augroup END

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

autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

autocmd FileType go call GoSetEnvirmentVariables()
autocmd FileType php set synmaxcol=120
