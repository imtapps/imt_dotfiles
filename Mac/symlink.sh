##
# You must delete all existing *zsh*, *vim* and *tmux* files and directories
# in your home folder before running this
##

# delete broken symlinks TEMP!!!
rm -rf ~/.vim
rm -rf ~/.vimrc
rm -rf ~/.tmux
rm -rf ~/.tmux.conf
rm -rf ~/highlighters
rm -rf ~/.zsh_prompt
rm -rf ~/zsh-syntax-highlighting.zsh
rm -rf ~/.zshrc

# Symlink the new config files. Assumes files are saved in ~/imt_dotfiles
ln -s ~/imt_dotfiles/Mac/vim ~/.vim
ln -s ~/imt_dotfiles/Mac/vimrc ~/.vimrc
ln -s ~/imt_dotfiles/Mac/tmux ~/.tmux
ln -s ~/imt_dotfiles/Mac/tmux.conf ~/.tmux.conf
ln -s ~/imt_dotfiles/Mac/highlighters ~/highlighters
ln -s ~/imt_dotfiles/Mac/zsh_prompt ~/.zsh_prompt
ln -s ~/imt_dotfiles/Mac/zsh-syntax-highlighting.zsh ~/zsh-syntax-highlighting.zsh
ln -s ~/imt_dotfiles/Mac/zshrc ~/.zshrc

# Clone vundle so we can update vim plugins
#git clone https://github.com/gmarik/vundle.git ~/imt_dotfiles/vim/bundle/vundle

