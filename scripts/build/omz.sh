#!/bin/bash

. ./lib/funcs.sh

omz="Oh-My-ZSH"

omzPlugin() { installing $omz "Plugin" $1; }
omzTheme() { installing $omz "Theme" $1; }

### Install OMZ ###
if ! [[ -d "$HOME/.oh-my-zsh" ]]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    noinstall $omz
fi

### Install OMZ Plugins ###
plugins=(
    "zsh-users/zsh-autosuggestions"
    "zsh-users/zsh-syntax-highlighting"
    "marlonrichert/zsh-autocomplete"
)

# Iterate through plugins list and download from github to custom plugins folder
for plugin in "${plugins[@]}"
do
    # Split plugin name to pull out package name
    IFS='/' # delimiter used to split $plugin
    read -ratmp<<< "$plugin" # put value of splitting $plugin variable into $tmp array

    gitLink="https://github.com/$plugin.git" # create github link based on full plugin name
    pluginName="${tmp[1]}"
    pluginDir="$HOME/.oh-my-zsh/custom/plugins/$pluginName"
    
    # only install the plugin if the plugin is not installed on the target system
    if ! [[ -d $pluginDir ]]; then
        # Alert user of plugin that is being installed
        omzPlugin $pluginName
        echo "Downloading $(color 3 plugin) $(color 5 $pluginName) from $(color 1 "$gitLink"...)"
        
        git clone "$gitLink" "$pluginDir"
    else
        noinstall "$omz plugin $pluginName"
    fi
done


### Install OMZ Themes ###
# Powerlevel10K
omzTheme "Powerlevel10K"
git clone --depth=1 "https://github.com/romkatv/powerlevel10k.git" "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"