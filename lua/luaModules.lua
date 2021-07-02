--"Telescope
print('in here')
require('telescope').setup {
    defaults ={
        prompt_prefix = "ʕᵔ//ᴥ//ᵔʔ",
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        }
    },
}
require('telescope').load_extension('fzy_native')
