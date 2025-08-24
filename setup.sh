#!/bin/bash


/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install $(cat packages/homebrew)
mise use -g $(cat packages/mise)

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim


for file in dotfiles/*; do
    filename=$(basename "$file")
    cp -r "$file" ~/."$filename"
done

if [[ -f karabiner.json ]]; then
    mkdir -p ~/.config/karabiner
    cp karabiner.json ~/.config/karabiner/
fi

if [[ -d KeyBindings ]]; then
    cp -r KeyBindings ~/Library/
fi

git config --global core.excludesfile ~/.gitignore_global
$(brew --prefix)/opt/fzf/install

