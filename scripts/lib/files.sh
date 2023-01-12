#!/bin/bash

export FILES=(
    ".gitconfig"
    ".gitignore_global"
    ".p10k.zsh"
    ".prettierrc"
    ".vimrc"
    ".zshrc"
    "Library/Application Support/Code/User/settings.json"
)

export CONFIG_DIR="../configs"

export VSC_DIR="$CONFIG_DIR/.vscode"
export VSC_JSON="$VSC_DIR/settings.json"

copy() { cp -i $1 $2; }