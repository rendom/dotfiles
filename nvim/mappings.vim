" Split nav
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')

nnoremap , ;
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
nnoremap <silent> <C-K> :ObviousResizeUp<CR>
nnoremap <silent> <C-J> :ObviousResizeDown<CR>
nnoremap <silent> <C-H> :ObviousResizeLeft<CR>
nnoremap <silent> <C-L> :ObviousResizeRight<CR>

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

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
au FileType go nmap <leader>B <Plug>(go-build)
au FileType go nmap <leader>T <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>e <Plug>(go-rename)
au FileType go nmap <Leader>i <Plug>(go-info)


"au FileType javascript nmap <Leader>r :Autoformat<CR>
map <silent> <leader>r :call Reformat()<cr>

" alt mappings to make life easier
nnoremap <A-a> <C-a>
nnoremap <A-x> <C-x>


nnoremap <A-j> <C-d>zz
nnoremap <A-k> <C-u>zz
vnoremap <A-j> <C-d>zz
vnoremap <A-k> <C-u>zz

nnoremap <A-n> :cnext<cr>
nnoremap <A-p> :cprevious<cr>
nnoremap <A-h> <C-O>
nnoremap <A-l> <C-I>

nnoremap <C-n> :cnext<cr>
nnoremap <C-p> :cprevious<cr>

" better command-line editing 
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-h> <t_kl>
cnoremap <C-l> <t_kr>

cnoremap <A-j> <t_kd>
cnoremap <A-k> <t_ku>
cnoremap <A-h> <t_kl>
cnoremap <A-l> <t_kr>

" "neocomplete
"inoremap <expr><tab>
"      \ pumvisible() ?
"      \ deoplete#mappings#close_popup() : "\<tab>"
"        let g:deoplete#enable_smart_case=1
"
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"" <C-h>, <BS>: close popup and delete backword char.
"inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> deoplete#smart_close_popup()."\<C-h>"
"inoremap <expr><C-y>  deoplete#close_popup()
"inoremap <expr><C-e>  deoplete#cancel_popup()


"foldstuff
nnoremap <leader>z zMzvzz
nnoremap <leader>Z zMzOzz
nnoremap za zazz

"emmet
let g:user_emmet_mode='a'
let g:user_emmet_leader_key='<c-e>'

nmap <silent> <leader>ff :FSHere<cr>

" fu ex mode
nmap Q <Nop>

" get file path..
map <leader>ew :e <C-R>=expand("%:p:h") . "/" <CR>

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

" Search @ visual select
vnoremap // y/<C-R>"<CR>
