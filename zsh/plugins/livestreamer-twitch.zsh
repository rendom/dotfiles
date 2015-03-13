#!/bin/zsh
# Twitch + Livestreamer <3
_livestr_get_following(){
	cat $XDG_CONFIG_HOME/twitch/following
}

_livestr_get_online_streams(){
    LIST=""
    CSLIST=$(_livestr_get_following | tr -s "\n" ",")
    RESULT=$(curl -s "https://api.twitch.tv/kraken/streams?channel=$CSLIST")
    for stream in $(_livestr_get_following); do
        ISONLINE=$(echo $RESULT | grep -i "\"name\":\"$stream\"")
        if [[ -n $ISONLINE ]]; then
            LIST="$stream\n$LIST"
        fi
    done
    echo $LIST
}

livestr(){
    if [ ! -z "$1" ]; then
        R=$1
    else
        ONLINESTREAMS=$(_livestr_get_online_streams)
        R=$(echo $ONLINESTREAMS | dmenu -fn "tamsyn:size=6" -p "Twitch" -i)
    fi
    [ -z "$R" ] || livestreamer http://twitch.tv/$R best

}

_livestr(){
	compadd `_livestr_get_online_streams`
}



compdef _livestr livestr
