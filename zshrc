ZSH=~/.oh-my-zsh
ZSH_THEME="dieter"

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000

bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/raza/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall


DISABLE_AUTO_UPDATE="true"
COMPLETION_WAITING_DOTS="true"


# Completion

# Make zsh know about hosts already accessed by SSH
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) 
/dev/null)"}%%[# ]*}//,/ })'

zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS} 
zstyle ':completion::complete:*' use-cache true
zstyle ':completion:*:default' menu select=1

# cd will never select the parent directory (e.g.: cd ../<TAB>):
zstyle ':completion:*:cd:*' ignore-parents parent pwd

# formatting and messages
zstyle ':completion:*' verbose yes
zstyle ':completion:*:matches' group yes
zstyle ':completion:*:options' description yes
zstyle ':completion:*:descriptions' format $'\e[01;33m -- %d --\e[0m'
zstyle ':completion:*:messages' format $'\e[01;35m -- %d --\e[0m'
zstyle ':completion:*:warnings' format $'\e[01;31m -- No Matches Found --\e[0m'
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:options' auto-description '%d'

zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin
zstyle ':completion:*:complete:scp:*:files' command command -
zstyle ':completion:*:complete:rsync:*:files' command command -
zstyle ':completion:*:complete:git:*:files' command command -
zstyle ':completion:*' list-separator '==>'
zstyle ':completion:*:manuals' separate-sections true

## add colors to processes for kill completion
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

# command completion: highlight matching part of command
zstyle -e ':completion:*:-command-:*:commands' list-colors 'reply=( '\''=(#b)('\''$words[CURRENT]'\''|)*-- 
#(*)=0=38;5;45=38;5;136'\'' '\''=(#b)('\''$words[CURRENT]'\''|)*=0=38;5;45'\'' )'

# activate menu selection
zstyle ':completion:*' menu select

# activate approximate completion, but only after regular completion (_complete)
zstyle ':completion:::::' completer _complete _approximate
# limit to 2 errors
zstyle ':completion:*:approximate:*' max-errors 2

# no beep sound
setopt nolistbeep no_beep

# Keybindings

insert-root-prefix() {
  BUFFER="sudo $BUFFER"
  CURSOR="$(($CURSOR + 5))"
}
zle -N insert-root-prefix
bindkey '^S' insert-root-prefix


# omzh
source $ZSH/oh-my-zsh.sh

# aliases
file="$HOME/.alias"; [ -f "$file" ] && source "$file"

# functions
file="$HOME/.functions"; [ -f "$file" ] && source "$file"

# extras
file="$HOME/.extras"; [ -f "$file" ] && source "$file"

unset file;



# get notified when someone logs in
#watch=all                       # watch all logins
#logcheck=30                     # every 30 seconds
#WATCHFMT="%n from %M has %a tty%l at %T %W"
