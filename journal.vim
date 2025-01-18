" Set of tools for daily journaling and notetaking
"
function Open_today()
    let filename=strftime("%Y-%m-%d").".md"
    let directory ="~/.journaling/"
    execute "e ".directory.filename
    echom directory.filename
endfunction

function Open_tomorrow()
    let filename=strftime("%Y-%m-%d",localtime() + (24*3600)).".md"
    let directory ="~/.journaling/"
    execute "e ".directory.filename
    echom directory.filename
endfunction

function Open_yesterday()
    let filename=strftime("%Y-%m-%d",localtime() - (24*3600)).".md"
    let directory ="~/.journaling/"
    execute "e ".directory.filename
    echom directory.filename
endfunction


function! Open_next_monday()
    " Get current weekday (1-7, where 1 is Monday)
    let l:current_day = strftime("%u")
    " Calculate days until next Monday
    let l:days_to_monday = (8 - l:current_day) % 7
    if l:days_to_monday == 0
        let l:days_to_monday = 7
    endif
    " Create filename with next Monday's date
    let l:filename = strftime("%Y-%m-%d", localtime() + (24*3600 * l:days_to_monday)) . ".md"
    let l:directory = "~/.journaling/"
    execute "e " . l:directory . l:filename
    echom l:directory . l:filename
endfunction

nnoremap <leader>jf <cmd>lua require('telescope.builtin').find_files({cwd="~/.journaling/"})<cr>
nnoremap <leader>jg <cmd>lua require('telescope.builtin').live_grep({cwd="~/.journaling/"})<cr>
nnoremap <leader>jj <cmd>call Open_today()<cr>
nnoremap <leader>jt <cmd>call Open_tomorrow()<cr>
nnoremap <leader>jy <cmd>call Open_yesterday()<cr>
nnoremap <leader>jm <cmd>call Open_next_monday()<cr>
