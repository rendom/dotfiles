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
