#!/bin/bash

createMessage() {
    append=$([ $1 ] && echo " $1 Applications" || echo "...")
    echo "Installing Homebrew$append"
}

createMessage

### Install Homebrew ###
# check if the directory exists
if ! [[ -d "/usr/local/Cellar/" ]]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo 'Not installing homebrew.\nAlready installed.'
fi


### Install Homebrew Applications ###
createMessage 'Common'
# Common brew applications
brew install nvm
brew install vim
brew install tty-clock

brew install --cask vlc
brew install --cask gimp
brew install --cask keka
brew install --cask alfred
brew install --cask firefox
brew install --cask rectangle
brew install --cask balenaetcher
brew install --cask transmission

### Optional ###

# Media
createMessage 'Media'
brew install --cask kid3
brew install --cask plex

# Battery
createMessage 'Battery Related'
brew install --cask aldente

# Internet
createMessage 'Internet'
brew install --cask discord
brew install --cask megasync
brew install --cask expressvpn
brew install --cask google-chrome

# Hobbies
createMessage 'Hobby'
brew install --cask ultimaker-cura
brew install --cask ableton-live-suite

# Developer Tools
createMessage 'Developer'
brew install --cask docker
brew install --cask visual-studio-code

# FONTS
createMessage 'Font'
brew tap homebrew/cask-fonts
brew install --cask font-fira-code
brew install --cask font-hack-nerd-font
brew install --cask font-jetbrains-mono