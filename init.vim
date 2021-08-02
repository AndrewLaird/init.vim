"this is our vimrc
call plug#begin()

Plug 'morhetz/gruvbox'
" Functionalities
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sleuth'
Plug 'roryokane/detectindent'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'chrisbra/Colorizer'
Plug 'KabbAmine/vCoolor.vim'
Plug 'vim-scripts/loremipsum'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'metakirby5/codi.vim'
" " for comments in many languages
Plug 'preservim/nerdcommenter'
" Summary of the files functions
Plug 'preservim/tagbar'
" Used for Ag in vim fugitiveo
Plug 'ggreer/the_silver_searcher'
"Used for Rg in vim fugitive
Plug 'BurntSushi/ripgrep'
" Status bar
Plug 'vim-airline/vim-airline'

" TeleScope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
" Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': 'TSUpdate'}
Plug 'nvim-treesitter/playground'
" LSP
" requires npm install -g intelephense
Plug 'neovim/nvim-lspconfig'
" Function signatures
Plug 'ray-x/lsp_signature.nvim'
" Completions
Plug 'hrsh7th/nvim-compe'
" Better indent for php html
Plug 'captbaritone/better-indent-support-for-php-with-html'
" Primeagen refactoring
" Plug 'ThePrimeagen/refactoring.nvim'
" pluggin while I work on it
Plug 'AndrewLaird/refactoring.nvim'

"plugins for datascience
Plug 'KKPMW/vim-sendtowindow'        " send commands to REPL
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" Document strings
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }
call plug#end()
"
" " vim-sensible does alot of the work
" " but here's the last 1%
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
set completeopt=menuone
" allow the use of mouse, as a treat
"set mouse=a
"
" " Custom Mappings
let mapleader=" "
"
nmap <leader>ee :Colors<CR>
nmap <leader>s <C-w>s<C-w>j:terminal<CR>
nmap <leader>vs <C-w>v<C-w>l:terminal<CR>
"nmap <leader>f :Files<CR>
nmap <leader>t :TagbarToggle<CR>
" fold everything based on indent
nmap <leader>fm :set foldmethod=indent<CR>
" Dealing with quickfix list
nmap <C-p> :cprev <CR>
nmap <C-n> :cnext <CR>
nmap <leader>o :copen<CR>

" Telescope
:lua require('luaModules')


" Find files using Telescope command-line sugar.
" Customize telescope to use native fuzzy finder
"nnoremap <leader>f <cmd>Telescope find_files<cr>
"nnoremap <leader>g <cmd>Telescope live_grep<cr>
"nnoremap <leader>fb <cmd>Telescope buffers<cr>
"nnoremap <leader>fh <cmd>Telescope help_tags<cr>

nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fi <cmd>lua require('telescope.builtin').find_files({cwd="~/.config/nvim/"})<cr>
nnoremap <leader>fl <cmd>lua require('telescope.builtin').lsp_references()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fs <cmd>lua require('telescope.builtin').grep_string()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap gr <cmd>lua require('telescope.builtin').lsp_references()<cr>
nnoremap <leader>r <cmd>source ~/.config/nvim/init.vim<cr>

"vnoremap <leader>tt <cmd>lua require('refactoring.106').extract()<cr>
"nnoremap <leader>tt <cmd>lua require('refactoring.106').extract()<cr>

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

augroup DetectIndent
       autocmd!
          autocmd BufReadPost *  DetectIndent
      augroup END

      autocmd FileType javascript map <buffer> <leader>r :w<CR>:exec '!node' shellescape(@%, 1)<CR>

" terminal mode escape to return to normal mode
tnoremap <leader><ESC> <C-\><C-n>

lua << EOF
local nvim_lsp = require('lspconfig')
-- LSP
require'lspconfig'.intelephense.setup{}

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
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  --buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  --buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  --buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  --buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  --buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  --buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  --buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>gf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = {'intelephense'}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end
EOF

" Make adjusing split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize -3<CR>
noremap <silent> <C-Down> :resize +3<CR>


" Source journal bindings
source ~/.config/nvim/journal.vim
" Source python bindings/plugins
" source ~/.config/nvim/datascience.vim
