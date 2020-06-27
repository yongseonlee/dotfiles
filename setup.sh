#!/bin/bash


/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap homebrew/cask-fonts
brew cask install $(cat .homebrew/casks)
brew install $(cat .homebrew/formulae)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"


git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim


for file in $(ls -a); do
    if [[ $file == karabiner.json ]]; then
        mkdir -p ~/.config/karabiner
        cp $file ~/.config/karabiner/
    elif [[ $file == KeyBindings ]]; then
        cp -r $file ~/Library/
    elif [[ ! $file =~ ^\.+ && $file != $0 ]]; then
        cp -r $file ~/.$file
    fi
done

git config --global core.excludesfile ~/.gitignore_global
