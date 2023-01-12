#!/bin/bash

# Code    Color
# 0       Black
# 1       Red
# 2       Green
# 3       Yellow
# 4       Blue
# 5       Magenta
# 6       Cyan
# 7       White
# Colors the console output, prints text and then removes styling
color() { echo "$(tput setaf $1)$2$(tput sgr 0)"; }

installing() {
    append=$([ $3 ] && echo " $(color 5 $3) $(color 3 $2)" || echo "...")
    echo "$(color 2 "Installing") $(color 6 $1)$append"
}

noinstall() {
    echo "$(color 1 NOT) installing $(color 6 $1)..."
    echo "$(color 1 "The program is already installed")"
}