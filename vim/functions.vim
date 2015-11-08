function! Reformat() "{{{2
    let b:winview = winsaveview()
    Autoformat
    $put _
    exec '$;?\(^\s*$\)\@!?+1,$d'
    exec '%s/\s\+$//e'
    call winrestview(b:winview)
endfunction

