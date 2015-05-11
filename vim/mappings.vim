" Split nav
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap , ;

""unite hax
"nnoremap <silent> <leader>b :<C-U>Unite buffer<cr>
"nnoremap <silent> <leader>t :<C-U>Unite file_rec/async:!<cr>
"nnoremap <silent> <leader>g :<C-U>Unite grep<cr>
"nnoremap <silent> <leader>l :<C-U>Unite line<cr>

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

" reset search
nmap <leader>/ :let @/ = ""<CR>


"map arrow keys..
noremap <down> :m+<CR>
noremap <up> :m-2<CR>
inoremap <down> <esc>:m+<CR>
inoremap <up> <esc>:m-2<CR>
vnoremap <down> :m'>+<CR>gv
vnoremap <up> :m-2<CR>gv

inoremap <left> <esc><<
inoremap <right> <esc><<
noremap <left> <<
noremap <right> >>
vnoremap <left> <<
vnoremap <right> >>

"choosewin
nmap - <Plug>(choosewin)

"resize
nnoremap <silent> <C-k> :ObviousResizeUp<CR>
nnoremap <silent> <C-j> :ObviousResizeDown<CR>
nnoremap <silent> <C-h> :ObviousResizeLeft<CR>
nnoremap <silent> <C-l> :ObviousResizeRight<CR>

nmap <leader>- <Plug>(choosewin)

" paste stuff
"vnoremap y "ay
"vnoremap Y "ay
"vnoremap p "ap
"vnoremap P "ap
"nnoremap y "ay
"nnoremap Y "ay
"nnoremap p "ap
"nnoremap P "ap

"go stuff
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>e <Plug>(go-rename)


