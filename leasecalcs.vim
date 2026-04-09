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

function! OpenCorrespondingTestFile()
    " Get the current file path relative to the working directory
    let current_file = expand('%:.')

    " Split the path into components
    let path_components = split(current_file, '/')

    " Construct the test file path
    let test_path = ['tests'] + path_components
    let test_file = join(test_path, '/')

    " Replace the file extension with '_Test.php'
    let test_file = substitute(test_file, '\.php$', '_Test.php', '')

    " Check if the test file exists
    if !filereadable(test_file)
        " If it doesn't exist, create the directory structure
        let test_dir = fnamemodify(test_file, ':h')
        if !isdirectory(test_dir)
            call mkdir(test_dir, 'p')
        endif
    endif

    " Open the test file
    execute 'edit ' . test_file
endfunction

" Map the function to a key combination (e.g., <Leader>t)
nnoremap <Leader>ct :call OpenCorrespondingTestFile()<CR>


" Map the function to a key combination, for example, <Leader>cs
" nnoremap <Leader>ss :call CamelToSnake()<CR>
nnoremap <Leader>sc :call SnakeCaseUnderCursor()<CR>

" Run phpunit test and show the result
function! Run_test()
    let testing_file = expand('%')
    " Execute the bash script with the current file as an argument
    let output = system('bash run_phpunit.sh ' . shellescape(testing_file))
    " Display the result in a message
    echo output
endfunction

nnoremap <leader>rt <cmd>call Run_test()<cr>
