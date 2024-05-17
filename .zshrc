# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# shellcheck disable=SC1090,SC2296
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

export VISUAL='nvim'
export EDITOR='nvim'

export ZSH="$HOME/.oh-my-zsh" # Path to your oh-my-zsh installation.

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
export ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git                     # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git
	sudo                    # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/sudo
	tmux                    # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/tmux
	aliases                 # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/aliases
	vi-mode                 # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/vi-mode
	nvm                     # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/nvm
	yarn                    # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/yarn
	rust                    # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/rust
	golang                  # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/golang
	pnpm                    # https://github.com/ntnyq/omz-plugin-pnpm
	zsh-autocomplete        # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/autocomplete
	zsh-autosuggestions     # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/autosuggestions
	zsh-syntax-highlighting # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/highlighting
)

if [[ "$OSTYPE" == "linux-gnu" ]]; then
	plugins+=(
		archlinux # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/archlinux
		systemd   # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/systemd
	)
else
	plugins+=(
		macos # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/macos
	)
fi

# if [[ ]]

source $ZSH/oh-my-zsh.sh

alias nv='nvim'
alias lg='lazygit'
alias ls='lsd'
# alias restart='shutdown -r 0'

# Catppuccin Mocha ZSH Syntax highlighting
source "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}"/themes/zsh-syntax-highlighting/themes/catppuccin_mocha-zsh-syntax-highlighting.zsh

if [[ "$OSTYPE" == "linux-gnu" ]]; then

	alias CM_LAUNCHER=wofi

	export QT_QPA_PLATFORMTHEME=qt6ct

	# load nvm from AUR
	source /usr/share/nvm/init-nvm.sh
else
	# load nvm from homebrew
	export NVM_DIR="$HOME/.nvm"
	[ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/nvm/nvm.sh"
	[ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm"
fi

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

export GOPATH=$HOME/go

export PATH=$HOME/.cargo/bin/:$PATH       # append rust binaries to path
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin # append go binaries to path

set -o vi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
