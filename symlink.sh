##
# You must delete all existing *zsh*, *vim* and *tmux* files and directories
# in your home folder for these new files to work
##
rm -rf ~/.tmux
rm -rf ~/.zsh-custom
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
rm -rf ~/.zsh_prompt
rm -rf ~/.zsh-syntax-highlighting.zsh
rm -rf ~/highlighters
rm -rf ~/.ackrc
rm -rf ~/README
rm -rf ~/.antigen
rm -rf ~/.antigen.zsh


# Symlink the new config files. Assumes files are saved in ~/imt_dotfiles
ln -s ~/imt_dotfiles/vim ~/.vim
ln -s ~/imt_dotfiles/vimrc ~/.vimrc
if [ "$(uname)" = "Darwin" ]; then
    ln -s ~/imt_dotfiles/tmux/mac_tmux ~/.tmux
else
    ln -s ~/imt_dotfiles/tmux/linux_tmux ~/.tmux
fi
ln -s ~/imt_dotfiles/tmux/tmux.conf ~/.tmux.conf
ln -s ~/imt_dotfiles/zsh/zshrc ~/.zshrc
ln -s ~/imt_dotfiles/ackrc ~/.ackrc
ln -s ~/imt_dotfiles/gitconfig ~/.gitconfig
ls -s ~/imt_dotfiles/gemrc ~/.gemrc

# If vundle doesn't exist clone it so we can update vim plugins
if [ ! -d ~/imt_dotfiles/vim/bundle/vundle ]; then
    git clone https://github.com/gmarik/vundle.git ~/imt_dotfiles/vim/bundle/vundle
fi

echo -n "Would you like to configure your git name and email? (y/n) => "; read answer
if [[ $answer = "Y" ]] || [[ $answer = "y" ]]; then
    echo -n "What is your git user name => "; read name
    git config --global user.name "$name"
    echo -n "What is your git email => "; read email
    git config --global user.email "$email"
fi

echo "*******************************"
echo "*    Restart your terminal    *"
echo "*******************************"

