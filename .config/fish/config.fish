if status is-interactive
   #############################
   # Shell aesthetic
   #############################

   set fish_greeting

   navi widget fish | source # CTRL+G
   zoxide init fish | source

   # Atuin
   set -gx ATUIN_NOBIND "true"
   atuin init fish | source

   # bind to ctrl-r in normal and insert mode, add any other bindings you want here too
   bind \cr _atuin_search
   bind -M insert \cr _atuin_search

   export EDITOR=/usr/bin/vim
end

starship init fish | source

# Colors
set -l teal 94e2d5
set -l flamingo f2cdcd
set -l mauve cba6f7
set -l pink f5c2e7
set -l red f38ba8
set -l peach fab387
set -l green a6e3a1
set -l yellow f9e2af
set -l blue 89b4fa
set -l gray 1f1d2e
set -l black 191724

# man => https://github.com/decors/fish-colored-man
set -g man_blink -o $teal
set -g man_bold -o $yellow
set -g man_standout -b $gray
set -g man_underline -u $blue

#############################
# Functions
#############################

function cheat --description 'alias for cheat.sh'
   curl "cheat.sh/$argv?style=native"
end

# Necessary because the way fish works is not POSIX with variables
# See `functions/fish_ssh_agent.fish`
function add-ssh --wraps ssh-add --description "Start ssh-agent if not started yet, or uses already started ssh-agent."
   fish_ssh_agent
   ssh-add -q -t 10h
end

#############################
# Abbreviations
#############################

# ChatGPT
abbr --set-cursor=! -a trans aichat -r translator:french '"!"'

# Git
abbr -a gco git checkout
abbr -a gs  git status
abbr -a ga  git add 
abbr -a gaa git add .
abbr --set-cursor=! -a gcm git commit -m '"!"'
abbr -a gpl git pull
abbr -a gpu git push

#############################
# Aliases
#############################

# Set distro-specific variables
set -g pkg_update     "yay -Syu"
set -g pkg_install    "yay -S"
set -g pkg_clean      "yay -Sc"
set -g pkg_autoremove "yay -R (yay -Qdtq)"
set -g bat "bat"
set -g exa "exa"

# Package manager
alias update=$pkg_update
alias install=$pkg_install
alias clean=$pkg_clean
alias autoremove=$pkg_autoremove

# Navigating files and directories
alias la="$exa -1 --icons --group-directories-first --grid --long --no-time --group --all"
alias ls="$exa -1 --icons --group-directories-first"
alias l="$exa --git --icons --group-directories-first --long --group --all"

alias c="$bat"
alias cat="$bat"
alias catp="$bat --plain"

alias cd="z"

# Finding utilities
alias rfind="find / -name $1 2> /dev/null" # We don't want irrelevant erros
alias hfind="find ~ -name $1 2> /dev/null"

alias findstr="grep -rlie $1"

# Utilities
alias cl="clear"
alias ip="ip -c"
alias trash="mv --force -t ~/.local/share/Trash "
alias h="history"
alias hgrep="history | grep $1"
alias mkdir="mkdir -p $1"
alias wget="wget -c"

# Confirm commands
#alias cp="cp -i"
#alias mv="mv -i"
#alias rm="rm -i"

# System utilities 
alias meminfo="free -hlt --mega"
alias mostu="du -hsx * | sort -rh | head -10"
alias top="btop"
alias ciao="shutdown now"

# Frequently used configs
set editor "code" # Preferred editor

alias fish-config="$editor ~/.config/fish/config.fish"
alias kitty-config="$editor ~/.config/kitty/kitty.conf"
alias posh-config="$editor ~/.poshthemes/yellowish.omp.json"
alias neofetch-config="$editor ~/.config/neofetch/config.conf"

alias hypr-config="$editor ~/.config/hypr/hyprland.conf"
alias hyprpaper-config="$editor ~/.config/hypr/hyprpaper.conf"
alias hypr-start-config="$editor ~/.config/hypr/autostart"
alias waybar-config="$editor ~/.config/waybar/"
alias anyrun-config="$editor ~/.config/anyrun"
alias dunst-config="$editor ~/.config/dunst"

alias sddm-config="sudo $editor /etc/sddm.conf"
alias sddm-theme-config="sudo $editor /usr/share/sddm/themes/sugar-candy"

alias vim-config="$editor ~/.vimrc"

# Kitty
alias icat="kitty +kitten icat"

# Debug
alias hyprland-debug='watch -n 0.1 "cat /tmp/hypr/$(echo $HYPRLAND_INSTANCE_SIGNATURE)/hyprland.log | grep -v \"arranged\" | tail -n 40"'

# Special
alias reboot-windows='systemctl reboot --boot-loader-entry=auto-windows'
