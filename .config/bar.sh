#!/bin/sh

status() {
  echo -n "[$(date "+%0I:%0M %a %b %d")] "
  STATUS=$(playerctl -p vlc -s status)

  # No options if no music is playing
  if [[ $STATUS == "" ]]
  then
    exit 0
  fi

  echo -n "[$(playerctl -p vlc -s metadata title)] "

  if [[ $STATUS == "Playing" ]]
  then
    echo -n "[>]"
  else
    echo -n "[-]"
  fi
}

while true; do
  xsetroot -name "$(status)"
  sleep 2
done
