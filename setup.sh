#!/bin/bash


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
