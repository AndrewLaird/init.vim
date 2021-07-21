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
        },
        --fzf = {
            --fuzzy = true,                    -- false will only do exact matching
            --override_generic_sorter = false, -- override the generic sorter
            --override_file_sorter = true,     -- override the file sorter
            --case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
        --}
    },
}
require('telescope').load_extension('fzy_native')
--require('telescope').load_extension('fzf')
