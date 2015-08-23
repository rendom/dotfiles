#!/bin/sh
xrdb -load .Xresources

#vars
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export _JAVA_AWT_WM_NONREPARENTING=1
export VDPAU_NVIDIA_NO_OVERLAY=1
export EDITOR="vim"
export BROWSER="firefox"

#export PATH=$PATH:$HOME/bin


if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# xpad instead..
#xboxdrv -c $HOME/.xboxdrv -s --mimic-xpad --deadzone 10% &

setxkbmap se

#mopidy &
autocutsel -fork &
autocutsel -selection PRIMARY -fork &

urxvtd &
compton --backend glx &

pulseaudio --start &
nvidia-settings -a '[gpu:0]/GPUPowerMizerMode=1'
nvidia-settings --load-config-only

ssh-agent herbstluftwm
