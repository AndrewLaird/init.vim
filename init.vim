"this is our vimrc
call plug#begin()

Plug 'morhetz/gruvbox'
" Functionalities
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sleuth'
Plug 'roryokane/detectindent'
Plug 'scrooloose/nerdtree'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'chrisbra/Colorizer'
Plug 'KabbAmine/vCoolor.vim'
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install' }
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
filetype off
filetype plugin indent on
" allow the use of mouse, as a treat
"set mouse=a
"
" " Custom Mappings
let mapleader=" "
"
nmap <leader>q :NERDTreeToggle<CR>
nmap <leader>ee :Colors<CR>
nmap <leader>s <C-w>s<C-w>j:terminal<CR>
nmap <leader>vs <C-w>v<C-w>l:terminal<CR>
nmap <leader>d <Plug>(pydocstring)
"nmap <leader>f :Files<CR>
nmap <leader>t :TagbarToggle<CR>

" Telescope
:lua require('luaModules')

" Find files using Telescope command-line sugar.
" Customize telescope to use native fuzzy finder
nnoremap <leader>f <cmd>Telescope find_files<cr>
nnoremap <leader>g <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" autocmd FileType python nmap <leader>x :0,$!python -m yapf<CR>
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
