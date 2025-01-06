#!/bin/sh

# install brewfile
brew bundle install

# download and install alfred workflows
workflow_path="$HOME/Library/Application\ Support/Alfred/Alfred.alfredpreferences"

curl -o workflows.zip https://raw.githubusercontent.com/stephansama/alfred-configuration/refs/heads/main/workflows.zip

unzip workflows

mv workflows "$workflow_path"

rm -rf workflows.zip
