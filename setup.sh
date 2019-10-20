#!/bin/bash


if [[ $1 == "--brew" ]]; then
    if [[ ! command -v brew >/dev/null 2>&1 ]]; then
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi
    brew tap caskroom/cask
    brew tap homebrew/cask-fonts
    brew cask install $(cat .homebrew/casks)
    brew install $(cat .homebrew/formulae)
    $(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)
fi


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
