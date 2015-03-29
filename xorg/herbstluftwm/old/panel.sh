#!/bin/bash

monitor=${1:-0}

geometry=($(herbstclient monitor_rect "$monitor"))
if [ -z "$geometry" ] ;then
    echo "Invalid monitor $monitor"
fi
# geometry has the format: WxH+X+Y
x=${geometry[0]}
y=${geometry[1]}
panel_width=${geometry[2]}

$XDG_CONFIG_HOME/herbstluftwm/panel.rb | $HOME/bin/bar -w $panel_width -l $x
