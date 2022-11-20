#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# twm &
# xclock -geometry 50x50-1+1 &
# xterm -geometry 80x50+494+51 &
# xterm -geometry 80x20+494-0 &
# exec xterm -geometry 80x66+0+0 -name login

# gnome-keyring
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcsll,secrets,ssh)
export SSH_AUTH_SOCK

# touchpad settings
xinput set-prop "Synaptics TM3289-021" "libinput Tapping Enabled" 1
xinput set-prop "Synaptics TM3289-021" "libinput Natural Scrolling Enabled" 1

# dropbox
/usr/bin/dropbox &

# nextcloud
/usr/bin/nextcloud &

# dunst
# dunst -config ~/.config/dunst/dunstrc &

exec systemd-inhibit --what=handle-power-key i3 
