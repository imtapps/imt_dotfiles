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
rm -rf ~/README

# Symlink the new config files. Assumes files are saved in ~/imt_dotfiles
ln -s ~/imt_dotfiles/Mac/vim ~/.vim
ln -s ~/imt_dotfiles/Mac/vimrc ~/.vimrc
ln -s ~/imt_dotfiles/Mac/tmux ~/.tmux
ln -s ~/imt_dotfiles/Mac/tmux.conf ~/.tmux.conf
ln -s ~/imt_dotfiles/Mac/highlighters ~/highlighters
ln -s ~/imt_dotfiles/Mac/zsh_prompt ~/.zsh_prompt
ln -s ~/imt_dotfiles/Mac/zsh-syntax-highlighting.zsh ~/zsh-syntax-highlighting.zsh
ln -s ~/imt_dotfiles/Mac/zshrc ~/.zshrc
ln -s ~/imt_dotfiles/Mac/ackrc ~/.ackrc

# Clone vundle so we can update vim plugins
git clone https://github.com/gmarik/vundle.git ~/imt_dotfiles/Mac/vim/bundle/vundle

