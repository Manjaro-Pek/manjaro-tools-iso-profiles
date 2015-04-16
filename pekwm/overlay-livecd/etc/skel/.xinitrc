
#!/bin/sh

#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)
#
# Written by pekman


if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi


## Ensure that GTK themes are applied uniformly in the Desktop Environment

export GTK2_RC_FILES="$HOME/.gtkrc-2.0" 

## Set a single desktop environment

exec pekwm
