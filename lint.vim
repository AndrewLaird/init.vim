" Function to add the current file to the exclusion list
function! AddCurrentFileToExclusionList()
    let exclusion_file = 'scripts/hooks/linter_exclusion_files.txt'
    let current_file = expand('%')

    " Ensure the path is relative to /app
    let app_relative_file = current_file

    " Read the exclusion list into a list
    let lines = readfile(exclusion_file)

    " Check if the file is already in the list
    if index(lines, app_relative_file) == -1
        " Add the file to the list
        call add(lines, app_relative_file)

        " Write the updated list back to the file
        call writefile(lines, exclusion_file)

        echo 'Added ' . app_relative_file . ' to ' . exclusion_file
    else
        echo app_relative_file . ' is already in ' . exclusion_file
    endif
endfunction


" Function to remove the current file from the exclusion list
function! RemoveCurrentFileFromExclusionList()
    let exclusion_file = 'scripts/hooks/linter_exclusion_files.txt'
    let current_file = expand('%')
    
    " Read the exclusion list, filter out the current file, and count removals
    let [new_lines, removed] = [[], 0]
    for line in readfile(exclusion_file)
        if line !=# current_file
            call add(new_lines, line)
        else
            let removed += 1
        endif
    endfor

    " Check if the file was found and removed
    if removed == 0
        echo current_file . " not found in exclusion list."
        return
    endif

    " Write the new list back to the file
    call writefile(new_lines, exclusion_file)
    echo 'Removed ' . current_file . ' from ' . exclusion_file
endfunction


" Command to call the function
command! RemoveCurrentFileFromExclusion call RemoveCurrentFileFromExclusionList()

" Command to call the function
command! AddCurrentFileToExclusion call AddCurrentFileToExclusionList()

" Run linter
nnoremap <leader>bb <cmd>!php-cs-fixer fix % --using-cache=no<cr>

" Call remove
nnoremap <leader>br <cmd>RemoveCurrentFileFromExclusion<cr>
" Call add
nnoremap <leader>ba <cmd>AddCurrentFileToExclusion<cr>
