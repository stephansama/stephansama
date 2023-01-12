#!/bin/bash

. ./build/brew.sh   # Install Homebrew (https://brew.sh/)
. ./build/omz.sh    # Install Oh-My-ZSH (https://ohmyz.sh/)

# Install configuration files
. ./lib/files.sh

# loop through files and add them to local user
for file in "${FILES[@]}"
do
    if [[ "$file" == */* ]]; then
        copy $VSC_JSON "$HOME/$file"
    else
        copy "$CONFIG_DIR/$file" "$HOME/$file"
    fi
done

# Enable YARN
corepack enable

exit 0