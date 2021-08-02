set splitbelow splitright 
" Remap splits navigation to just CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" open python terminal
map <Leader>p :new term://bash<CR>ipython3<CR><C-\><C-n><C-w><C-p>

" python alias (,p runs python on script. ,t times python script)
noremap <silent> ,p :w<CR>:!python3 %<CR>
noremap <silent> ,t :w<CR>:!time python3 %<CR>
