echo -n "What config would you like? (default/new) -> "; read response

if [[ "$response" = "new" ]] ; then
    # Rename the old config files
    mv .oh-my-zsh   .oh-my-zsh.bak
    mv .zsh-custom  .zsh-custom.bak
    mv .zsh_history .zsh_history.bak
    mv .zshrc       .zshrc.bak
    mv .zsh-update  .zsh-update.bak
    mv .gvimrc      .gvimrc.bak
    mv .vim         .vim.bak
    mv .viminfo     .viminfo.bak
    mv .vimrc       .vimrc.bak
    
    # Clone vundle so we can update vim plugins
    git clone https://github.com/gmarik/vundle.git ~/new_dots/vim/bundle/vundle

    # Symlink the new config files. Assumes files are saved in ~/new_dots
    ln -s ~/new_dots/vim ~/.vim
    ln -s ~/new_dots/vimrc ~/.vimrc
    ln -s ~/new_dots/tmux ~/.tmux
    ln -s ~/new_dots/tmux.conf ~/.tmux.conf
    ln -s ~/new_dots/highlighters ~/highlighters
    ln -s ~/new_dots/zsh_prompt ~/.zsh_prompt
    ln -s ~/new_dots/zsh-syntax-highlighting.zsh ~/zsh-syntax-highlighting.zsh
    ln -s ~/new_dots/zshrc ~/.zshrc
else
    # Remove symlinks
    rm ~/.vim
    rm ~/.vimrc
    rm ~/.tmux
    rm ~/.tmux.conf
    rm ~/highlighters
    rm ~/.zsh_prompt
    rm ~/zsh-syntax-highlighting.zsh
    rm ~/.zshrc

    # Restore the old config files
    mv .oh-my-zsh.bak   .oh-my-zsh   
    mv .zsh-custom.bak  .zsh-custom  
    mv .zsh_history.bak .zsh_history 
    mv .zshrc.bak       .zshrc       
    mv .zsh-update.bak  .zsh-update  
    mv .gvimrc.bak      .gvimrc      
    mv .vim.bak         .vim         
    mv .viminfo.bak     .viminfo     
    mv .vimrc.bak       .vimrc       
fi
