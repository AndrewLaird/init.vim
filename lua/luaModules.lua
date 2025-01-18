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


local M = {}

function M.hello_world()
    print("in here");
end
--
-- Disable Copilot by default
vim.g.copilot_enabled = false;

-- toggle_copilot.lua
function M.ToggleCopilot()
    if (vim.g.copilot_enabled == 1) then
        print("disabling")
        vim.cmd(":Copilot disable")
    else
        print("enabling")
        vim.cmd(":Copilot enable")
    end
end


-- Grep over quickfixlist
function M.GrepQuickfixFiles()
  local quickfix_list = vim.fn.getqflist()
  local files = {}
  
  -- Extract unique file paths from the quickfix list
  for _, item in ipairs(quickfix_list) do
    if item.bufnr > 0 then
      local file_path = vim.fn.bufname(item.bufnr)
      if file_path ~= "" and not vim.tbl_contains(files, file_path) then
        table.insert(files, file_path)
      end
    end
  end

  -- Run live_grep with the file paths as the search directories
  require('telescope.builtin').live_grep({ search_dirs = files })
end


return M
