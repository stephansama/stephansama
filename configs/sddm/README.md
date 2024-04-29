# [SDDM](https://github.com/catppuccin/sddm)

## Theming steps

- Install dependencies `qt6-svg qt6-declarative`
- Download theme from [Catppuccin Releases](https://github.com/catppuccin/sddm/releases)
- copy theme to `/usr/share/sddm/themes/`
- create `/etc/sddm.conf` if it doesn't exist
- add the following to the aforementioned file

```toml
[Theme]
Current=catppuccin-flavour
```
