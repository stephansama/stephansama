#!/bin/bash

cd "$(git submodule foreach '' | sed 's/Entering\ //g' | tr -d "'" | fzf)" || exit
