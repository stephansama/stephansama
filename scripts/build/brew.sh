#!/bin/bash

. ./lib/funcs.sh

brewMessage() { installing "Homebrew" "Applications" $1; }

brewMessage

### Install Homebrew ###
# check if the homebrew directory exists
if ! [[ -d "/usr/local/Cellar/" ]]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    noinstall "Homebrew"
fi


### Install Homebrew Applications ###
brewMessage 'Common'
# Common brew applications
brew install vim
brew install tty-clock

brew install --cask vlc
brew install --cask keka
brew install --cask alfred
brew install --cask rectangle
brew install --cask balenaetcher
brew install --cask transmission

### Optional ###

# Media
brewMessage 'Media'
brew install --cask kid3
brew install --cask plex

# Battery
brewMessage 'Battery Related'
brew install --cask aldente

# Gaming
brewMessage 'Gaming'
brew install --cask steam
brew install --cask battle-net

# Internet
brewMessage 'Internet'
brew install --cask discord
brew install --cask zoom
brew install --cask megasync
brew install --cask expressvpn
brew install --cask firefox
brew install --cask google-chrome

# Hobbies
brewMessage 'Hobby'
brew install --cask notion
brew install --cask gimp
brew install --cask inkscape
brew install --cask ultimaker-cura
brew install --cask ableton-live-suite

# Developer Tools
brewMessage 'Developer'
brew install nvm
brew install --cask docker
brew install --cask visual-studio-code

# FONTS
brewMessage 'Font'
brew tap homebrew/cask-fonts
brew install --cask font-fira-code
brew install --cask font-hack-nerd-font
brew install --cask font-jetbrains-mono