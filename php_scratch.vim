" Set of tools for daily python_scratch and notetaking
"
function Open_page_with_autoimport(filename)
    let scrapy_directory = "/www/sites/alaird.dev-leasecalcs.com/.scraphp/"
    let fullpath = scrapy_directory.a:filename
    if !filereadable(glob(fullpath))
        execute ':silent !cp '.scrapy_directory."start.php ".fullpath
    endif
    execute "e ".fullpath
    echo fullpath
endfunction

function Python_open_today()
    let filename=strftime("%Y-%m-%d").".php"
    call Open_page_with_autoimport(filename)
endfunction

function Python_open_today_page(page)
    let filename=strftime("%Y-%m-%d")."_".a:page.".php"
    call Open_page_with_autoimport(filename)
endfunction


function Python_open_tomorrow()
    let filename=strftime("%Y-%m-%d",localtime() + (24*3600)).".php"
    call Open_page_with_autoimport(filename)
endfunction

function Python_open_yesterday()
    let filename=strftime("%Y-%m-%d",localtime() - (24*3600)).".php"
    call Open_page_with_autoimport(filename)
endfunction

nnoremap <leader>tf <cmd>lua require('telescope.builtin').find_files({cwd="/www/sites/alaird.dev-leasecalcs.com/.scraphp/", no_ignore=true})<cr>
nnoremap <leader>tg <cmd>lua require('telescope.builtin').live_grep({search_dirs={"/www/sites/alaird.dev-leasecalcs.com/.scraphp/"}, additional_args = function(opts) return {"--hidden", "--no-ignore"} end })<cr>
nnoremap <leader>tt <cmd>call Python_open_today()<cr>
nnoremap <leader>t1 <cmd>call Python_open_today_page(1)<cr>
nnoremap <leader>t2 <cmd>call Python_open_today_page(2)<cr>
nnoremap <leader>t3 <cmd>call Python_open_today_page(3)<cr>
nnoremap <leader>t4 <cmd>call Python_open_today_page(4)<cr>
nnoremap <leader>t5 <cmd>call Python_open_today_page(5)<cr>
nnoremap <leader>t6 <cmd>call Python_open_today_page(6)<cr>
nnoremap <leader>t7 <cmd>call Python_open_today_page(7)<cr>
nnoremap <leader>t8 <cmd>call Python_open_today_page(8)<cr>
nnoremap <leader>t9 <cmd>call Python_open_today_page(9)<cr>
nnoremap <leader>ty <cmd>call Python_open_yesterday()<cr>
