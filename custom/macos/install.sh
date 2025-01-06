#!/bin/sh

workflow_path="/Users/stephanrandle/Library/Application\ Support/Alfred/Alfred.alfredpreferences"

curl -o workflows.zip https://raw.githubusercontent.com/stephansama/alfred-configuration/refs/heads/main/workflows.zip

unzip workflows

mv workflows "$workflow_path"

rm -rf __MACOSX workflows.zip
