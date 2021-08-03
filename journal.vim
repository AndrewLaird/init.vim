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

nnoremap <leader>jf <cmd>lua require('telescope.builtin').find_files({cwd="~/.journaling/"})<cr>
nnoremap <leader>jg <cmd>lua require('telescope.builtin').live_grep({cwd="~/.journaling/"})<cr>
nnoremap <leader>jj <cmd>call Open_today()<cr>
nnoremap <leader>jt <cmd>call Open_tomorrow()<cr>
nnoremap <leader>jy <cmd>call Open_yesterday()<cr>

