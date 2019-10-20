#!/bin/bash
for file in $(ls -a); do
    if [[ ! $file =~ ^\.+ && $file != $0 ]]; then
        cp -r $file ~/.$file
    fi
done
