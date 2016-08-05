command! CppCheck call s:CppCheck()

function! Reformat() "{{{2
    let b:winview = winsaveview()
    Autoformat
    $put _
    exec '$;?\(^\s*$\)\@!?+1,$d'
    exec '%s/\s\+$//e'
    call winrestview(b:winview)
endfunction

function! QuickFix(makeprgIn, makeefmIn) " {{{2
    try
        let save_makeprg=&makeprg
        let save_makeefm=&efm
        let &makeprg=a:makeprgIn
        let &efm=a:makeefmIn
        let &efm.=',%-G%.%#'
        wa
        make
        cwindow
    finally
        let &makeprg=save_makeprg
        let &efm=save_makeefm
    endtry
endfunction

function! s:CppCheck() " {{{2
    call QuickFix('cppcheck'.
                \ ' '.expand('%:p:h').
                \ ' -I/'.expand('%:p:h').
                \ ' --quiet'.
                \ ' --enable=all'.
                \ ' --suppress=variableScope'.
                \ ' --suppress=missingIncludeSystem'.
                \ ' --suppress=cstyleCast',
                \ '[%f:%l] -> [%s]: (%trror) %m,'.
                \ '[%f:%l] -> [%s]: (%tarning) %m,'.
                \ '[%f:%l] -> [%s]: (%ttyle) %m,'.
                \ '[%f:%l] -> [%s]: (%terformance) %m,'.
                \ '[%f:%l] -> [%s]: (%tortability) %m,'.
                \ '[%f:%l] -> [%s]: (%tnformation) %m,'.
                \ '[%f:%l] -> [%s]: (%tnconclusive) %m,'.
                \ '[%f:%l]: (%trror) %m,'.
                \ '[%f:%l]: (%tarning) %m,'.
                \ '[%f:%l]: (%ttyle) %m,'.
                \ '[%f:%l]: (%terformance) %m,'.
                \ '[%f:%l]: (%tortability) %m,'.
                \ '[%f:%l]: (%tnformation) %m,'.
                \ '[%f:%l]: (%tnconclusive) %m')
endfunction

let g:goEnvFunc = 0
function! GoSetEnvirmentVariables() 
    if g:goEnvFunc == 0
        if filereadable("Makefile") && match(readfile("Makefile"), "GO15VENDOREXPERIMENT=1")
            let $GO15VENDOREXPERIMENT = '1'
            let g:goEnvFunc = 1
        endif
    endif
endfunction





function! functions#compareQuickfixEntries(i1, i2) " {{{2
    if bufname((a:i1).bufnr) == bufname((a:i2).bufnr)
        return (a:i1).lnum == (a:i2).lnum ?
                    \ 0 :
                    \ ( (a:i1).lnum < (a:i2).lnum ? -1 : 1)

    elseif bufname((a:i1).bufnr) < bufname((a:i2).bufnr)
        return -1
    else
        return 1
    endif
endfunction
" 2}}}
function! functions#getLocList(bufname) " {{{2
    let l:bufnr = bufwinnr(a:bufname)
    let l:items = functions#fixList(getloclist(l:bufnr))
    if(!empty(l:items))
        call setloclist(l:bufnr, l:items, 'r')
        "call statusbar#setLocList(l:items)

        return QuickfixsignsUnique(l:items)
    endif

    return []
endfunction
" 2}}}
function! functions#getQFList(bufname) " {{{2
    let l:bufnr = bufwinnr(a:bufname)
    let l:items = functions#fixList(getqflist())
    if(!empty(l:items))
        call setqflist(l:items, 'r')
        "call statusbar#setQFList(l:items)

        return QuickfixsignsUnique(l:items)
    endif

    return []
endfunction
" 2}}}
function! functions#fixList(list) " {{{2
    let l:list = []

    for l:e in a:list
        if len(l:e['text']) > 0
            if l:e['type'] =~# '[wW]'
                let l:e['type'] = 'W'
            elseif l:e['type'] =~# '[eE]'
                let l:e['type'] = 'E'
            else
                let l:e['type'] = 'I'
            endif

            let l:list += [l:e]
        endif
    endfor

    return l:list
endfunction
" 2}}}
function! functions#setWarningType(entry) " {{{2
    if a:entry.type ==# ''
        if a:entry.text =~# 'error'
            let a:entry.type = 'E'
        else
            let a:entry.type = 'W'
        endif
    endif
endfunction
