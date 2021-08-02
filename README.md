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
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  ```


4. To get live_grep working in telescope, you'll need rip grep which can be installed with
  ```
  sudo add-apt-repository ppa:x4121/ripgrep
  sudo apt-get update
  sudo apt-get install ripgrep
  ```
