nnoremap <leader>fp <cmd>lua require('telescope.builtin').find_files({cwd="~/personal/scripts/"})<cr>
function Relative_Path_To_Current_Filename()
    let full_path = expand("%") 
    echo "full"
    echo  full_path
    let relative_path = substitute($full_path, "^.*app", "app", "g")
    echo "relative"
    echo relative_path
    return relative_path
endfunction


function Yank_Current_Filename()
    let @* = execute("call Relative_Path_To_Current_Filename()")
    echo getreg("*")
endfunction


nnoremap <leader>yn :call Yank_Current_Filename()<cr>
nnoremap <leader>yc <cmd>let @+ = expand("%")<cr>

