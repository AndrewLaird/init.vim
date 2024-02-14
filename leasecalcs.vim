function! CamelToSnake()
    :.s#\(\l\)\(\u\)#\1_\l\2#g
endfunction

function! SnakeCaseUnderCursor()
    " Save the current position
    let save_cursor = getpos('.')

    " Select the word under the cursor
    normal! viw

    " Yank the selected word into register 'z'
    normal! "zy

    " Paste the yanked word and convert it to snake_case
    let @z = tolower(substitute(@z, '\(\u\)', '_\1', 'g'))
    normal! diw
    execute "normal! h\"zp"

    " Restore the cursor position
    call setpos('.', save_cursor)
endfunction



" Map the function to a key combination, for example, <Leader>cs
nnoremap <Leader>ss :call CamelToSnake()<CR>
nnoremap <Leader>sc :call SnakeCaseUnderCursor()<CR>
