" Split nav
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap , ;

nnoremap <silent> <leader>b :<C-U>Unite buffer<cr>
nnoremap <silent> <leader>t :<C-U>Unite file_rec/async:!<cr>
nnoremap <silent> <leader>g :<C-U>Unite grep<cr>
nnoremap <silent> <leader>l :<C-U>Unite line<cr>

nnoremap <Tab> %

let pairs = { ":" : ":",
            \ "." : ".",
            \ "<bar>" : "<bar>",
            \ "," : ",",
            \ "/" : "/",
            \ ";" : ";",
            \ "+" : "+" }

for [key, value] in items(pairs)
    exe "nnoremap ci".key." T".key."ct".value
    exe "nnoremap ca".key." F".key."cf".value
    exe "nnoremap vi".key." T".key."vt".value
    exe "nnoremap va".key." F".key."vf".value
    exe "nnoremap di".key." T".key."dt".value
    exe "nnoremap da".key." F".key."df".value
    exe "nnoremap yi".key." T".key."yt".value
    exe "nnoremap ya".key." F".key."yf".value
endfor

