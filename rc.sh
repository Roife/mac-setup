cp ./.zshrc ~/.zshrc
cp ./.tmux.conf ~/.tmux.conf

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp ./.vimrc ~/.vimrc
vim +PluginInstall +qall

cp ./.wgetrc ~/.wgetrc
cp ./.clang-format ~/.clang-format
cp ./.gitconfig ~/.gitconfig
cp ./.gitignore ~/.gitignore
cp ./aria2.conf ~/.aria2/aria2.config