#!/bin/zsh
# Twitch + Livestreamer <3
local TWITCH_FOLLOWING_CACHE=$XDG_CONFIG_HOME/twitch_following;
_livestr_get_following() {
    if [ -f $TWITCH_FOLLOWING_CACHE ]; then
        /bin/cat $TWITCH_FOLLOWING_CACHE
    else
        _lvstr_fetch_twitch_following
    fi
}

_lvstr_fetch_twitch_following() {
    local PAGE=0;
    local OFFSET=0;
    local LIMIT=100;
    if [ ! -z "$1" ]; then
        OFFSET=$((LIMIT*$1));
        PAGE=$1
    fi

    local OUT=$(curl --silent\
        "https://api.twitch.tv/kraken/users/$TWITCHNAME/follows/channels?limit=$LIMIT&offset=$OFFSET")

    local CHANNELS=$(echo $OUT | grep -oP "\"name\":\"\K[^\"]+");
    local TOTAL=$(echo $OUT | grep -oP "\"_total\":\K[^\,]+");

    echo $CHANNELS | tee -a $TWITCH_FOLLOWING_CACHE

    if [ $OFFSET -le $TOTAL ];then
        _lvstr_fetch_twitch_following $((PAGE+1))
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
        fi
        #else
        #    LIST+=("${stream}:OFFLINE")
        #fi
    done

    _describe -t LIST 'streams' LIST

    return 0
}

twitch() {
    if [[ -n "$1" ]]; then
        if [[ $1 =~ "^https?\:\/\/.+" ]]; then
            livestreamer $1 best
        else
            livestreamer http://twitch.tv/$1 best
        fi
    fi
}

compdef _livestr twitch
