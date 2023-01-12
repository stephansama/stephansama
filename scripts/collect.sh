#!/bin/bash

. ./lib/files.sh

echo 'Copying system configuration files to repo configs folder'

# loop through files and add them to this repo
for file in "${FILES[@]}"
do
    # check if filename has a directory within it
    if [[ "$file" == */* ]]; then
        mkdir -p $VSC_DIR # create parent directory
        copy "$HOME/$file" $VSC_JSON
    else
        copy $HOME/$file "$CONFIG_DIR/$file"
    fi
done

exit 0