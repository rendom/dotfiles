#!/bin/zsh
# Twitch + Livestreamer <3
_livestr_get_following() {
    if [ -f $XDG_CONFIG_HOME/twitch/following ]; then
        /bin/cat $XDG_CONFIG_HOME/twitch/following
    fi
}

_livestr() {
    if (( CURRENT != 2 )); then
        return 0
    fi

    local -a LIST
    local CSLIST=$(_livestr_get_following | tr -s "\n" ",")
    local RESULT="$(curl -s "https://api.twitch.tv/kraken/streams?channel=$CSLIST")"

    for stream in $(_livestr_get_following); do
        local ISONLINE="$(echo $RESULT | sed -n "/\"name\":\"$stream\"/p")"
        if [ ! -z "$ISONLINE" ]; then
            LIST+=("${stream}:ONLINE")
        else
            LIST+=("${stream}:OFFLINE")
        fi
    done

    _describe -t LIST 'streams' LIST

    return 0
}

twitch() {
    [ -z "$1" ] || livestreamer http://twitch.tv/$1 best

}

compdef _livestr twitch
