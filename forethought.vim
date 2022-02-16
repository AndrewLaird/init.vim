nnoremap <leader>fp <cmd>lua require('telescope.builtin').find_files({cwd="~/personal/scripts/"})<cr>

function Yank_Current_Filename()
    let @" = expand("%")
endfunction


nnoremap <leader>yc <cmd>let @" = expand("%")<cr>

