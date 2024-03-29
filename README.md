# init.vim
My Neovim configuration file

# Install
1. How to install Neovim:
https://github.com/neovim/neovim/wiki/Installing-Neovim  

2. Get this configuration file by cloning the repo in `~/.config/nvim`:
```
git clone https://github.com/AndrewLaird/init.vim.git ~/.config/nvim
```

3. download neovim 0.5 > 
```
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim
```
4.Install Plug
```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```


5. To get live_grep working in telescope, you'll need rip grep which can be installed with
```
sudo add-apt-repository ppa:x4121/ripgrep
sudo apt-get update
sudo apt-get install ripgrep
```
6. To get Python LSP working, install python lsp
```
pipx install 'python-lsp-server[all]'
```

7. Install the lsps for common languages
```
#https://github.com/neovim/nvim-lspconfig
# pyright
pip install pyright
# tsserver 
# intelephense, 
npm i intelephense -g
# rust_analyzer
brew install rust-analyzer
```
