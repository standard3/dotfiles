<h1 align="center">Dotfiles</h1>
<p align="center">This is the repository for storing and sharing my dotfiles and useful workflow tools.<p>
<p align="center">Disclaimer : this is heavily inspired from excellent flick0's <a href="https://github.com/flick0/dotfiles/tree/aurora">aurora dotfiles</a>.<p>
<div align="center">
    <img alt="Stars" src="https://img.shields.io/github/stars/cynikkk/dotfiles?style=for-the-badge">
    <br>
    <img alt="Open issues"     src="https://img.shields.io/github/issues/cynikkk/dotfiles?style=for-the-badge">
</div>

*todo: insert images here*

## Dependencies

As this setup is made for hyprland, a bleeding-edge distribution is recommended (e.g: arch, endeavouros, ...).

```bash
# General dependencies
$ yay -S oh-my-posh neofetch bat btop fish dunst waybar hyprland-git hyprpaper xdg-desktop-portal-hyprland-git polkit-kde-agent navi zoxide

# Oh-my-fish
$ curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
$ omf install https://github.com/decors/fish-colored-man
$ omf install https://github.com/jorgebucaran/autopair.fish
$ omf install https://github.com/gazorby/fish-abbreviation-tips
$ omf install https://github.com/acomagu/fish-async-prompt
$ omf install https://github.com/franciscolourenco/done
$ omf install sudope

# aichat
$ cargo install --force aichat
```

# Note

* As I am french, some keybinds won't work for you in `~/.config/hypr/hyprland.conf`. Think of that 😉
