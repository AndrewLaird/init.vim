--"Telescope
local actions = require('telescope.actions')
require('telescope').setup {
    defaults ={
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        prompt_prefix = "> ",
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        }
    }
}
require('telescope').load_extension('fzy_native')
 
 -- for calltree

-- configure the litee.nvim library 
require('litee.lib').setup({})
-- configure litee-calltree.nvim
require('litee.calltree').setup({})
