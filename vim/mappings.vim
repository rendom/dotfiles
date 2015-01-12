" Split nav
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap , ;

"unite hax
nnoremap <silent> <leader>b :<C-U>Unite buffer<cr>
nnoremap <silent> <leader>t :<C-U>Unite file_rec/async:!<cr>
nnoremap <silent> <leader>g :<C-U>Unite grep<cr>
nnoremap <silent> <leader>l :<C-U>Unite line<cr>

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

"undotree
nmap <leader>u :UndotreeToggle<CR>

"resize
nnoremap <silent> <C-k> :ObviousResizeUp<CR>
nnoremap <silent> <C-j> :ObviousResizeDown<CR>
nnoremap <silent> <C-h> :ObviousResizeLeft<CR>
nnoremap <silent> <C-l> :ObviousResizeRight<CR>

