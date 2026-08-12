#!/usr/bin/env sh

if type brew &>/dev/null; then
	echo "homebrew already installed skipping step"
else
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew bundle install

platform="$(uname)"

if [ "$platform" = "Darwin" ]; then
	mise run setup:macos
elif [ "$platform" = "msys" ]; then
	echo "attempting to run dotfile configuration on windows. exiting because thats a bad idea"
	exit 1
else
	mise run setup:linux
fi
