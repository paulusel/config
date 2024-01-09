#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . "$HOME/.bashrc"

#eval $(gnome-keyring-daemon --start)
#export SSH_AUTH_SOCK
# Append ~/.local/bin directory to PATH
export PATH="$PATH:$HOME/.local/bin"
#
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_DATA_HOME="$HOME/.local/share"

export CARGO_HOME="$XDG_DATA_HOME"/cargo
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export W3M_DIR="$XDG_STATE_HOME/w3m"
export GOPATH="$XDG_DATA_HOME"/go
export GOMODCACHE="$XDG_CACHE_HOME"/go/mod
export PASSWORD_STORE_DIR="$HOME/Projects/polin/pass-database"
export QT_QPA_PLATFORMTHEME=qt5ct

export RCLONE_PROGRESS=true

#if command -v ibus > /dev/null; then
#    export GTK_IM_MODULE=ibus
#    export QT_IM_MODULE=ibus
#    export XMODIFIERS='@im=ibus'
#fi

# wayland specific variables
if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    export MOZ_ENABLE_WAYLAND=1
    export QT_QPA_PLATFORM=wayland
    export CLUTTER_BACKEND=wayland
fi

# sway and xmonad are non-parenting WMs. Java apps need this variable to run well.
if [ "$DESKTOP_SESSION" = "sway" ] || [ "$DESKTOP_SESSION" = "xmonad" ]; then
    export _JAVA_AWT_WM_NONREPARENTING=1
fi


export XDG_PICTURES_DIR="$HOME/Pictures"
export EDITOR="/usr/bin/vim"
export PAGER="/usr/bin/nvimpager"
export VISUAL="/usr/bin/nvimpager"
#export MOZ_ENABLE_WAYLAND=1
#export QT_QPA_PLATFORM=wayland

# VA-API driver variable for hardware axeleration
# export LIBVA_DRIVER_NAME=i915

GPG_TTY=$(tty)
export GPG_TTY

# export QSYS_ROOTDIR="/home/paulo/.cache/paru/clone/quartus-free/pkg/quartus-free-quartus/opt/intelFPGA/20.1/quartus/sopc_builder/bin"

# Synchronize environment variables with systemd and dbus
dbus-update-activation-environment --systemd --all
