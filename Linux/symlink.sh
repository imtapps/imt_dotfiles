##
# You must delete all existing *zsh*, *vim* and *tmux* files and directories
# in your home folder for these new files to work
##
rm -rf ~/.tmux
rm -rf ~/.zsh-custom
rm -rf ~/.emacs.d
rm -rf ~/.gemrc
rm -rf ~/.gitignore
rm -rf ~/.gitmodules
rm -rf ~/.gvimrc
rm -rf ~/.vimrc
rm -rf ~/.viminfo
rm -rf ~/.vim
rm -rf ~/.oh-my-zsh
rm -rf ~/.slate
rm -rf ~/.tmux.conf
rm -rf ~/.zshrc
rm -rf ~/.gitconfig
rm -rf ~/README

# Symlink the new config files. Assumes files are saved in ~/imt_dotfiles
ln -s ~/imt_dotfiles/Linux/vim ~/.vim
ln -s ~/imt_dotfiles/Linux/vimrc ~/.vimrc
ln -s ~/imt_dotfiles/Linux/tmux ~/.tmux
ln -s ~/imt_dotfiles/Linux/tmux.conf ~/.tmux.conf
ln -s ~/imt_dotfiles/Linux/highlighters ~/highlighters
ln -s ~/imt_dotfiles/Linux/zsh_prompt ~/.zsh_prompt
ln -s ~/imt_dotfiles/Linux/zsh-syntax-highlighting.zsh ~/zsh-syntax-highlighting.zsh
ln -s ~/imt_dotfiles/Linux/zshrc ~/.zshrc
ln -s ~/imt_dotfiles/Linux/ackrc ~/.ackrc
ln -s ~/imt_dotfiles/Linux/gitconfig ~/.gitconfig

# Clone vundle so we can update vim plugins
git clone https://github.com/gmarik/vundle.git ~/imt_dotfiles/Linux/vim/bundle/vundle

