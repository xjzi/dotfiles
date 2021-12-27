#!/bin/sh
CONFIG=/home/henry/.config/

if [ -f $CONFIG/xrandrrc ]; then
	source $CONFIG/xrandrrc
fi

if [ -f $CONFIG/xkbrc ]; then
	xkbcomp $CONFIG/xkbrc $DISPLAY
fi

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

$CONFIG/bar.sh & exec dwm
