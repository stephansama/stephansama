ZSHRC="$HOME/.zshrc"

# write export to config file
if ! [[ -f $ZSHRC ]]; then
    touch $ZSHRC
fi

# install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

corepack enable