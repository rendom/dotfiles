#!/bin/sh
xrdb -load .Xresources

#fonts
#/etc/X11/xinit/xinitrc.d/infinality-settings
#xset +fp /usr/share/fonts/artwiz-fonts/
#xset +fp /usr/share/fonts/misc/
#xset +fp /usr/share/fonts/TTF/
#xset +fp /usr/share/fonts/local/

#xset fp rehash

#vars
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export _JAVA_AWT_WM_NONREPARENTING=1
export VDPAU_NVIDIA_NO_OVERLAY=1
export EDITOR="vim"
export BROWSER="firefox"
export __GL_SYNC_DISPLAY_DEVICE=DV-I-1
export __VDPAU_NVIDIA_SYNC_DISPLAY_DEVICE=DVI-I-1
export PATH=$HOME/bin:$PATH


if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi



#mouse @ /etc/X11/xorg.conf.d/50-mouse-acceleration.conf
#$HOME/gitstuff/dotfiles/bin/mouseSettings

# xpad instead..
#xboxdrv -c $HOME/.xboxdrv -s --mimic-xpad --deadzone 10% &

setxkbmap se

#init shit
#mopidy &
autocutsel -fork &
autocutsel -selection PRIMARY -fork &

urxvtd &
#compton --config $HOME/.compton.conf &
#compton --backend glx --config $HOME/.compton.conf &
#compton --backend glx --config $HOME/.compton.conf --glx-no-stencil --glx-no-rebind-pixmap --glx-swap-method exchange &
compton --xrender-sync-fence --backend glx \
    --config $HOME/.compton.conf \
    echo $! > $RUN_PATH/herbstluftwm/compton.pid

pulseaudio --start &
nvidia-settings -a '[gpu:0]/GPUPowerMizerMode=1'
nvidia-settings --load-config-only


ssh-agent herbstluftwm

