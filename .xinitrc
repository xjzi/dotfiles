#!/bin/sh
if [ -f $HOME/.xrandr ]; then
	source $HOME/.xrandr
fi

if [ -f $HOME/.xmodmap ]; then
	xmodmap .xmodmap
fi

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

exec xmonad
