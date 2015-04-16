## Default bashrc for manjaroPek
## Writen by pekman

if [ -f /etc/bash_completion ]; then
	    . /etc/bash_completion
fi

PATH=$PATH:~/.Scripts 

xhost +local:root > /dev/null 2>&1

complete -cf sudo

shopt -s cdspell
shopt -s checkwinsize
shopt -s cmdhist
shopt -s dotglob
shopt -s expand_aliases
shopt -s extglob
shopt -s histappend
shopt -s hostcomplete

export HISTSIZE=10000
export HISTFILESIZE=${HISTSIZE}
export HISTCONTROL=ignoreboth
export JAVA_FONTS=/usr/share/fonts/TTF
export EDITOR=/usr/bin/xfw

# Aliases
alias ls='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias ll='ls -l --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias la='ls -la --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias grep='grep --color=tty -d skip'
alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias np='nano PKGBUILD'
alias fixit='sudo rm -f /var/lib/pacman/db.lck && sudo pacman-mirrors -g && sudo pacman -Syyuu  && sudo pacman -Suu'
alias c='clear'
alias x='exit'
alias np='nano PKGBUILD'
alias news='newsbeuter'
alias pod='podbeuter'
alias mt='bashmount'
alias mocx='mocp -x'
alias rt='rtorrent -o http_capath=/etc/ssl/certs'
alias yt='youtube-viewer'
alias we='weechat'
alias mpg='mpg123 --stereo --float  --control --title *mp3'
alias mps='mpg123 --stereo --float  --control -v -v -@'
alias ogg='ogg123 *.ogg'
alias oge='oggenc -q 9 *.flac'

# MPV audio Player alias
alias mpvnova='mpv --no-video'
alias mpvshuf='mpvnova --shuffle --loop inf'
alias mpvp='mpvshuf --playlist'
playcurrentdir() {
mpvp <(find "$PWD" -type f -follow)
}
alias pcd='playcurrentdir'
playdir() {
if [[ $# == 0 ]]; then
echo "playdir requires one or more directories on input."
else
if [[ $(uname) == "Linux" ]]; then READLINK=readlink;
else READLINK=greadlink; fi
mpvshuf --playlist <(find "$@" -type f -follow -exec $READLINK -f {} \;)
unset READLINK
fi
}
alias pd='playdir'
alias mpvl='mpv --ytdl-format=18 --ontop'

# Bash Advanced Hytory Line
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# ex - archive extractor
# usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# prompt
PS1='\[\e[1;30m\]» \[\e[0;33m\]\H@\u\[\e[1;30m\]╺─╸\[\e[1;30m\][\[\e[0m\]\W\[\e[1;30m\]]\[\e[1;34m\]\[\e[0m\]\[\e[m \] '

# xdg
BROWSER=/usr/bin/xdg-open
