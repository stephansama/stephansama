. ./build/brew.sh   # Install Homebrew (https://brew.sh/)
. ./build/omz.sh    # Install Oh-My-ZSH (https://ohmyz.sh/)

# Install configuration files
. ./files.sh

for file in "${FILES[@]}"
do
    cp -i "$CONFIG_DIR/$file" "$HOME/$file"
done


# Enable YARN
corepack enable