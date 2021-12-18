#!/bin/sh
if [ -f $HOME/.config/xrandrrc ]; then
	source $HOME/.config/xrandrrc
fi

if [ -f $HOME/.config/xkbrc ]; then
	xkbcomp $HOME/.config/xkbrc $DISPLAY
fi

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

exec xmonad
