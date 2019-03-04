# Set defaults
export EDITOR="subl3"
export SUDO_EDITOR="nano"
export BROWSER="chrome"
export PAGER="less"
export TERMINAL="terminator"


#remove duplicates and spaces
export HISTCONTROL=erasedups:ignorespace

#grep color
export GREP_COLOR="1;34"

export LESS="-FXRS"

#disable .lesshst
export LESSHISTFILE="/dev/null"

#man page coloring using less
export LESS_TERMCAP_mb=$'\e[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\e[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\e[0m'           # end mode
export LESS_TERMCAP_se=$'\e[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\e[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\e[0m'           # end underline
export LESS_TERMCAP_us=$'\e[04;38;5;146m' # begin underline

# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X"

# Prefer US English and use UTF-8
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

#xterm colors
if [ -e "/usr/share/terminfo/x/xterm-256color" ]; then
    export TERM="xterm-256color"
else
    export TERM="xterm-color"
fi

# define the prefered visual terminal
export VTERM="x-terminal-emulator"

# GPG fix for innapropriate ioctl device
export GPG_TTY=`tty`
#gpgconf --launch gpg-agent
#export SSH_AUTH_SOCK=$HOME/.gnupg/S.gpg-agent.ssh
