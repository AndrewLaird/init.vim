" Set of tools for daily python_scratch and notetaking
"

function Python_open_today()
    let filename=strftime("%Y-%m-%d").".py"
    let scrapy_directory = "~/forethought/forethought-server/.scrapy/"
    execute "e ".scrapy_directory.filename
    echom scrapy_directory.filename
endfunction

function Python_open_tomorrow()
    let filename=strftime("%Y-%m-%d",localtime() + (24*3600)).".py"
    let scrapy_directory = "~/forethought/forethought-server/.scrapy/"
    execute "e ".scrapy_directory.filename
    echom scrapy_directory.filename
endfunction

function Python_open_yesterday()
    let filename=strftime("%Y-%m-%d",localtime() - (24*3600)).".py"
    let scrapy_directory = "~/forethought/forethought-server/.scrapy/"
    execute "e ".scrapy_directory.filename
    echom scrapy_directory.filename
endfunction

nnoremap <leader>tf <cmd>lua require('telescope.builtin').find_files({cwd="~/forethought/forethought-server/.scrapy/"})<cr>
nnoremap <leader>tg <cmd>lua require('telescope.builtin').live_grep({cwd="~/forethought/forethought-server/.scrapy/"})<cr>
nnoremap <leader>tt <cmd>call Python_open_today()<cr>
nnoremap <leader>ty <cmd>call Python_open_yesterday()<cr>

