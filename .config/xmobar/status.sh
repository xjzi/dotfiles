#!/bin/sh
STATUS=$(playerctl -p vlc -s status)
SONG=$(playerctl -p vlc -s metadata title)

# No options if no music is playing
if [[ $STATUS == "" ]]
then
  exit 0
fi

echo -n "${SONG}: "
if [[ $STATUS == "Playing" ]]
then
  echo -n "|>"
else
  # The extra space makes it line up with pause in xmobar
  echo -n "||"
fi

