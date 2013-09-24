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

# Symlink the new config files. Assumes files are saved in ~/imt_dotfiles
ln -s ~/imt_dotfiles/Mac/vim ~/.vim
ln -s ~/imt_dotfiles/Mac/vimrc ~/.vimrc
ln -s ~/imt_dotfiles/Mac/tmux ~/.tmux
ln -s ~/imt_dotfiles/Mac/tmux.conf ~/.tmux.conf
ln -s ~/imt_dotfiles/Mac/highlighters ~/highlighters
ln -s ~/imt_dotfiles/Mac/zsh-syntax-highlighting.zsh ~/zsh-syntax-highlighting.zsh
ln -s ~/imt_dotfiles/Mac/zshrc ~/.zshrc
ln -s ~/imt_dotfiles/Mac/ackrc ~/.ackrc
ln -s ~/imt_dotfiles/Mac/gitconfig ~/.gitconfig

# If vundle doesn't exist clone it so we can update vim plugins
if [ ! -d ~/imt_dotfiles/Mac/vim/bundle/vundle ]; then
    git clone https://github.com/gmarik/vundle.git ~/imt_dotfiles/Mac/vim/bundle/vundle
fi

echo -n "Would you like to configure you git name and email? (y/n) => "; read answer
if [[ $answer = "Y" ]] || [[ $answer = "y" ]]; then
    echo -n "What is your git user name => "; read name
    git config --global user.name "$name"
    echo -n "What is your git email => "; read email
    git config --global user.email "$email"
fi

echo -n "Would you like to use the new prompt with only counts for the git status (y/n) => "; read answer
if [[ $answer = "Y" ]] || [[ $answer = "y" ]]; then
    ln -s ~/imt_dotfiles/Mac/zsh_prompt_count ~/.zsh_prompt
else
    ln -s ~/imt_dotfiles/Mac/zsh_prompt ~/.zsh_prompt
fi

echo "*******************************"
echo "*    Restart your terminal    *"
echo "*******************************"

