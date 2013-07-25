# Symlink the new config files. Assumes files are saved in ~/new_dots
ln -s ~/new_dots/vim ~/.vim
ln -s ~/new_dots/vimrc ~/.vimrc
ln -s ~/new_dots/tmux ~/.tmux
ln -s ~/new_dots/tmux.conf ~/.tmux.conf
ln -s ~/new_dots/highlighters ~/highlighters
ln -s ~/new_dots/zsh_prompt ~/.zsh_prompt
ln -s ~/new_dots/zsh-syntax-highlighting.zsh ~/zsh-syntax-highlighting.zsh
ln -s ~/new_dots/zshrc ~/.zshrc

# Clone vundle so we can update vim plugins
git clone https://github.com/gmarik/vundle.git ~/new_dots/vim/bundle/vundle

