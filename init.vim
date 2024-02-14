"this is our vimrc
call plug#begin()

" Color Scheme
Plug 'morhetz/gruvbox'
" Functionalities
" Git inside vim, so like :Git diff and Git status (super nice)
Plug 'tpope/vim-fugitive'
" Just some defaults to make vim nice
Plug 'tpope/vim-sensible'
" Adds the surround command, used to change surounding characters
" You can change "Hello" to 'Hello' or (Hello)
Plug 'tpope/vim-surround'
" (Best plugin), sets shiftwidth/tabwith to whatever the file is already, it's set and forget
Plug 'tpope/vim-sleuth'
" Similar
Plug 'roryokane/detectindent'
" Python client for LSP
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-jedi'
" () {} ""
Plug 'jiangmiao/auto-pairs'
" <table></table> etc...
Plug 'alvan/vim-closetag'

" creates snipits, I don't have it bound
Plug 'hrsh7th/vim-vsnip'
" for comments in many languages
Plug 'preservim/nerdcommenter'
" Summary of the files functions
Plug 'preservim/tagbar'
" Look at class function or structure
Plug 'liuchengxu/vista.vim'
"
" Used for Ag in vim fugitiveo
Plug 'ggreer/the_silver_searcher'
"Used for Rg in vim fugitive
Plug 'BurntSushi/ripgrep'
" Status bar
Plug 'vim-airline/vim-airline'

" Get call tree
 Plug 'ldelossa/litee.nvim'
 Plug 'ldelossa/litee-calltree.nvim'

" TeleScope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
" Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': 'TSUpdate'}
Plug 'nvim-treesitter/playground'
" Keep functions and for loops on screen
Plug 'nvim-treesitter/nvim-treesitter-context'
" LSP
" requires npm install -g intelephense
Plug 'neovim/nvim-lspconfig'
" Function signatures
Plug 'ray-x/lsp_signature.nvim'
" Completions
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
" Better indent for php html
Plug 'captbaritone/better-indent-support-for-php-with-html'
" Primeagen refactoring
Plug 'ThePrimeagen/refactoring.nvim'
" pluggin while I work on it
" Plug 'AndrewLaird/refactoring.nvim'

" plugins for datascience
" lets you send python code to a terminal split
Plug 'KKPMW/vim-sendtowindow'        " send commands to REPL

" Document strings
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }
" Line diff
Plug 'AndrewRadev/linediff.vim'
" very infrequently a tree is nice
Plug 'preservim/nerdtree'

" pluging with chrome or firefox to have this config in text areas
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

" Vim slime for sending text to another window
Plug 'jpalardy/vim-slime'

Plug 'ruanyl/vim-gh-line'


" Docker tools
Plug 'ekalinin/Dockerfile.vim'

" Rust tools
"
" Codeum code compleition
" Plug 'Exafunction/codeium.vim'
" Code completion :Copilot setup
Plug 'github/copilot.vim'

" Async linter, used for mypy , appears to be slow
" Plug 'scrooloose/syntastic'
" Plug 'neomake/neomake'
"
" grep and replace
Plug 'nvim-pack/nvim-spectre'

call plug#end()
"
" " vim-sensible does alot of the work
" " but here's the last 1%
" Side by side git diff
set diffopt=vertical
"
set scrolloff=7
colorscheme gruvbox
set bg=dark
"
" " Opaque Background (Comment out to use terminal's profile)
set termguicolors
  
  " Transparent Background (For i3 and compton)
  "highlight Normal guibg=NONE ctermbg=NONE
  "highlight LineNr guibg=NONE ctermbg=NONE
"
"   """ Other Configurations
set shiftwidth=4 tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent
set incsearch ignorecase smartcase nohlsearch
set ruler laststatus=2 showcmd showmode
set wrap breakindent
set nolist
set encoding=utf-8
set relativenumber
set number
set title
set undodir=~/.config/nvim/undo-dir
set undofile
set redrawtime=100000
filetype off
filetype plugin indent on
" for completion
set completeopt=menu,menuone,noselect
" allow the use of mouse, as a treat
"set mouse=a
"
" " Custom Mappings
let mapleader=" "
"
"nmap <leader>s <C-w>s<C-w>j:terminal<CR>
nmap <leader>vs <C-w>v<C-w>l:terminal<CR>
"nmap <leader>f :Files<CR>
"nmap <leader>t :TagbarToggle<CR>
" fold everything based on indent
nmap <leader>fm :set foldmethod=indent<CR>
" Dealing with quickfix list
nmap <C-p> :cprev <CR>
nmap <C-n> :cnext <CR>
nmap <leader>o :copen<CR>

" Telescope
:lua require('luaModules')
:lua require('function_between_lines')

function! FunctionsBetweenLines(start_line, end_line)
    return luaeval('functions_between_lines(_A[1], _A[2])', [a:start_line, a:end_line])
endfunction
command! -nargs=2 FunctionsBetweenLines echo FunctionsBetweenLines(<f-args>)

nnoremap <leader>tc :lua require('luaModules').ToggleCopilot()<CR>


" Find files using Telescope command-line sugar.
" Customize telescope to use native fuzzy finder
"nnoremap <leader>f <cmd>Telescope find_files<cr>
"nnoremap <leader>g <cmd>Telescope live_grep<cr>
"nnoremap <leader>fb <cmd>Telescope buffers<cr>
"nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Find files in current directory
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
" Find files in current directory
nnoremap <leader>fhf <cmd>lua require('telescope.builtin').find_files({hidden=true, no_ignore=true})<cr>
" Find files you've opened recently
nnoremap <leader>fo <cmd>lua require('telescope.builtin').oldfiles()<cr>
" Find files in your nvim directory
nnoremap <leader>fi <cmd>lua require('telescope.builtin').find_files({cwd="~/.config/nvim/"})<cr>
" Grep files in your nvim directory
nnoremap <leader>gi <cmd>lua require('telescope.builtin').live_grep({cwd="~/.config/nvim/"})<cr>
" 
nnoremap <leader>fl <cmd>lua require('telescope.builtin').lsp_references()<cr>
" Live Grep, Fxg but you go straight there
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
" Grep the string under your cursor
nnoremap <leader>fs <cmd>lua require('telescope.builtin').grep_string()<cr>
" Find instance of your current filename, (great for moving up the tree if you're in a view)
nnoremap <leader>fc <cmd>lua require('telescope.builtin').grep_string({search=vim.fn.expand "%:t:r"})<cr>
" See your buffers, weirdest way to do tabs there is, it's the list of current
" files you've opened in this session
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
" all the help for all the functions you have (wild)
nnoremap <leader>fa <cmd>lua require('telescope.builtin').help_tags()<cr>
" all your marks, great for traversing global marks because you can see where
" you're going 
nnoremap <leader>fj <cmd>lua require('telescope.builtin').marks()<cr>
" goto the references of what is under your cursor
nnoremap gr <cmd>lua require('telescope.builtin').lsp_references()<cr>
" reload init.vim
nnoremap <leader>rl <cmd>source ~/.config/nvim/init.vim<cr>
" reload zshrc 
nnoremap <leader>fz <cmd>e ~/.zshrc<cr>
" include hidden
nnoremap <leader>fhz <cmd>lua require('telescope.builtin').find_files({cwd="~",hidden=true})<cr>
nnoremap <leader>rz <cmd>!source ~/.zshrc<cr>
" nnoremap <leader>bb <cmd>!python3 -m black %<cr><cmd>!python3 -m autoflake --in-place %<cr>
 nnoremap <leader>bb <cmd>!php-cs-fixer fix % --using-cache=no<cr>
" run current php file
 nnoremap <leader>pp <cmd>!php %<cr>
" run current php file
 nnoremap <leader>ts <cmd>set ts=4<cr>

" Makes <shift>Y behave like <shift>D (grab until end of the line)
nnoremap Y yg$ 

nnoremap <leader>S <cmd>lua require("spectre").open()<CR>

" Toggle copilot on and off
" Copilot off by default
" let g:copilot_enabled = v:false
" Copilot get next suggestion
" imap <C-n> <Plug>(copilot-next)
" imap <C-p> <Plug>(copilot-previous)
" Copilot request a suggestion
" imap <C-y> <Plug>(copilot-suggest)


" for making marks all uppercase
" noremap <silent> <expr> ' "'".toupper(nr2char(getchar()))
" noremap <silent> <expr> m "m".toupper(nr2char(getchar()))
" sunmap '
" sunmap m

" Testing for refactoring, ignore

" LSP config

"" autocmd FileType python nmap <leader>x :0,$!python -m yapf<CR>
" "autocmd FileType python nmap <leader>r :w<CR>:exec '!python3'
" shellescape(@%, 1)<CR>
" autocmd FileType python map <buffer> <leader>r :w<CR>:exec '!python3'
" shellescape(@%, 1)<CR>
" " having trouble with auto indent on html files
autocmd FileType html set sw=4
"nmap <leader>n :HackerNews best<CR>J
nmap <silent> <leader><leader> :noh<CR>
" remember last cursor position
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  \ |   exe "normal! g`\""
  \ | endif

" If you're in javascript, auto run it with  <leader>r
"augroup DetectIndent
       "autocmd!
          "autocmd BufReadPost *  DetectIndent
      "augroup END

      "autocmd FileType javascript map <buffer> <leader>r :w<CR>:exec '!node' shellescape(@%, 1)<CR>

" terminal mode escape to return to normal mode
tnoremap <leader><ESC> <C-\><C-n>



" nvim-cmp
lua <<EOF


  -- setup nvim-treesitter-context
  require'nvim-treesitter.configs'.setup {
      -- A list of parser names, or "all"
      ensure_installed = {"php","python","c","rust"},

      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,

      -- Automatically install missing parsers when entering buffer
      -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
      auto_install = true,

      highlight = {
        -- `false` will disable the whole extension
        enable = true,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
      },
    }

  -- Setup nvim-cmp.
  local cmp = require'cmp'
  vim.opt.completeopt = { "menu", "menuone", "noselect" }

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    mapping = {
      ["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
      ["<Down>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
      ["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
      ["<Up>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ["<c-y>"] = cmp.mapping(
      cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      },
      { "i", "c" }
      ),
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it. 
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).

EOF




"" until EOF, this is in lua
lua << EOF



local nvim_lsp = require('lspconfig')
-- LSP
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  -- go to where this was declared
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  -- go to where this was declared
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  -- hover over the item to get it signature
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  -- don't think these  are implemented for our php
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  --Formats the file
  buf_set_keymap("n", "<space>gf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  --buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  --buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  --buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  -- Remaps for the refactoring operations currently offered by the plugin
  require('refactoring').setup({})
  vim.api.nvim_set_keymap("v", "<space>re", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]], {noremap = true, silent = true, expr = false})
  vim.api.nvim_set_keymap("v", "<space>rf", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]], {noremap = true, silent = true, expr = false})
  vim.api.nvim_set_keymap("v", "<space>rv", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]], {noremap = true, silent = true, expr = false})
  vim.api.nvim_set_keymap("v", "<space>ri", [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], {noremap = true, silent = true, expr = false})


  -- Extract block doesn't need visual mode
  vim.api.nvim_set_keymap("n", "<leader>rb", [[ <Cmd>lua require('refactoring').refactor('Extract Block')<CR>]], {noremap = true, silent = true, expr = false})
  vim.api.nvim_set_keymap("n", "<leader>rbf", [[ <Cmd>lua require('refactoring').refactor('Extract Block To File')<CR>]], {noremap = true, silent = true, expr = false})

  -- Inline variable can also pick up the identifier currently under the cursor without visual mode
  vim.api.nvim_set_keymap("n", "<leader>ri", [[ <Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], {noremap = true, silent = true, expr = false})

  -- load refactoring Telescope extension
  require("telescope").load_extension("refactoring")

  -- remap to open the Telescope refactoring menu in visual mode
  vim.api.nvim_set_keymap(
      "v",
      "<leader>rr",
      "<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
      { noremap = true }
  )


end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
-- pyright is too good, the type checking shows problems in our type defenitions
-- local servers = {'pylsp', "tsserver"}
local servers = {'pyright', "intelephense", 'rust_analyzer'}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end



EOF


" Codeium bindings"
"let g:codeium_manual = v:true"
"imap <script><silent><nowait><expr> <C-s> codeium#Complete()"
"imap <script><silent><nowait><expr> <C-g> codeium#Accept()
" imap <C-;>   <Cmd>call codeium#CycleCompletions(1)<CR>
" imap <C-,>   <Cmd>call codeium#CycleCompletions(-1)<CR>
" imap <C-x>   <Cmd>call codeium#Clear()<CR>
" Add to status line"
" set statusline+=\{…\}%3{codeium#GetStatusString()}"

" for firenvim"
"let fc = g:firenvim_config['localSettings']"
"let fc['https?://[^/]+\.co\.uk/'] = { 'takeover': 'never', 'priority': 1 }"

" For vim slime"
let g:slime_target = "tmux"
let g:slime_paste_file = "$HOME/.slime_paste"
" or maybe..."
let g:slime_paste_file = tempname()
" for third window first pane"
let g:slime_default_config = {"socket_name": get(split($TMUX, ","), 0), "target_pane": ":3.0"}
" for current window second pane"
"let g:slime_default_config = {"socket_name": get(split($TMUX, ","), 0), "target_pane": ":.1"}"

" using mypy as syntax checker"
" let g:syntastic_python_checkers=['mypy']"

" Source journal bindings"
" Sets up the commands for journalilng"
source ~/.config/nvim/journal.vim
" Sets up commands for python scratch, to get the right formatting"
"source ~/.config/nvim/python_scratch.vim
source ~/.config/nvim/php_scratch.vim
" Sets up the commands for testing"
" source ~/.config/nvim/testing.vim"
" Source python bindings/plugins"
source ~/.config/nvim/datascience.vim
source ~/.config/nvim/forethought.vim
source ~/.config/nvim/leasecalcs.vim

" Don't fix the lack of newline at the end of a file 
" prevents me from changing every file I visit
set nofixendofline

set tabstop=4
set shiftwidth=4
set expandtab
