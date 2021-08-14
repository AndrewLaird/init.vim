let site = '/www/sites/alaird.dev-leasecalcs.com/app'

function Search_in_testing()
    lua require('telescope.builtin').find_files({cwd= vim.g.site .. "/tests"})
endfunction

function Current_file_to_testing_file()
    let testing_file = expand('%');
    lua print(vim.g.testing_file)
    lua vim.g.testing_file = string.gsub(vim.g.testing_file, site, '')
endfunction
    

nnoremap <leader>ft  <cmd>call Search_in_testing()<cr>
nnoremap <leader>tt  <cmd>call Current_file_to_testing_file()<cr>
