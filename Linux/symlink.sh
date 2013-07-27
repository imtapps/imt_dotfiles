##
# You must delete all existing *zsh*, *vim* and *tmux* files and directories
# in your home folder before running this
##

# Symlink the new config files. Assumes files are saved in ~/imt_dotfiles
ln -s ~/imt_dotfiles/Linux/vim ~/.vim
ln -s ~/imt_dotfiles/Linux/vimrc ~/.vimrc
ln -s ~/imt_dotfiles/Linux/tmux ~/.tmux
ln -s ~/imt_dotfiles/Linux/tmux.conf ~/.tmux.conf
ln -s ~/imt_dotfiles/Linux/highlighters ~/highlighters
ln -s ~/imt_dotfiles/Linux/zsh_prompt ~/.zsh_prompt
ln -s ~/imt_dotfiles/Linux/zsh-syntax-highlighting.zsh ~/zsh-syntax-highlighting.zsh
ln -s ~/imt_dotfiles/Linux/zshrc ~/.zshrc

# Clone vundle so we can update vim plugins
git clone https://github.com/gmarik/vundle.git ~/imt_dotfiles/Linux/vim/bundle/vundle

