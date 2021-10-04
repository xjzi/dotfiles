if [ -z "$HM_XPROFILE_SOURCED" ]; then
  . "/home/henry/.xprofile"
fi
unset HM_XPROFILE_SOURCED

systemctl --user start hm-graphical-session.target

xmodmap ~/.xmodmap

/nix/store/bziw4g7zl637r565hzi0xannby3lcn8y-xmonad-compile/bin/xmonad-x86_64-linux

systemctl --user stop graphical-session.target
systemctl --user stop graphical-session-pre.target

# Wait until the units actually stop.
while [ -n "$(systemctl --user --no-legend --state=deactivating list-units)" ]; do
  sleep 0.5
done
