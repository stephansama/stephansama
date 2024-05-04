# [GTK](https://wiki.archlinux.org/title/GTK)

- [NWG Look](https://archlinux.org/packages/extra/x86_64/nwg-look/)

## Theming

- [Catppuccin](https://aur.archlinux.org/packages/catppuccin-gtk-theme-mocha)

```sh
sudo yay -S catppuccin-gtk-theme-mocha 
```

Run this command in order to symlink the `gtk3.0` theme to [`gtk4.0`](https://github.com/catppuccin/gtk?tab=readme-ov-file#for-gtk-4-users)

```sh
# set the themes directory to wherever the catppuccin theme is installed to
# (default location from AUR)
THEME_DIR="/usr/share/themes/Catppuccin-Mocha-Standard-Red-Dark/"
mkdir -p "${HOME}/.config/gtk-4.0"
ln -sf "${THEME_DIR}/gtk-4.0/assets" "${HOME}/.config/gtk-4.0/assets"
ln -sf "${THEME_DIR}/gtk-4.0/gtk.css" "${HOME}/.config/gtk-4.0/gtk.css"
ln -sf "${THEME_DIR}/gtk-4.0/gtk-dark.css" "${HOME}/.config/gtk-4.0/gtk-dark.css"
```
