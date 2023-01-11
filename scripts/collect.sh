#!/bin/bash

. ./files.sh

codeDir="$CONFIG_DIR/.vscode"

# loop through files and add them to this repo
for file in "${FILES[@]}"
do
    # check if filename has a directory within it
    if [[ "$file" == */* ]]; then
        mkdir -p $codeDir # create parent directory
        cp -i "$HOME/$file" "$codeDir/settings.json"
    else
        cp -i $HOME/$file "$CONFIG_DIR/$file"
    fi
done