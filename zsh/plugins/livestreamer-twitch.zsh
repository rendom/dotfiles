# Twitch + Livestreamer <3
# curl -H 'Accept: application/vnd.twitchtv.v3+json' -X GET "https://api.twitch.tv/kraken/streams?channel=lirik,esl_sc2"
_livestr_get_following(){
	cat $XDG_CONFIG_HOME/twitch/following
}

livestr(){
    if [ ! -z "$1" ]; then
        R=$1
    else
        LIST=""
        for stream in $(_livestr_get_following); do
            RESULT=$(curl --silent https://api.twitch.tv/kraken/streams/$stream)
            if [[ ! $RESULT =~ "\"stream\":null}" ]]; then
                LIST="$stream\n$LIST"
            fi
        done
        R=$(echo $LIST | dmenu -fn "tamsyn:size=6" -p "Twitch" -i)
    fi
    [ -z "$R" ] || livestreamer http://twitch.tv/$R best

}


_livestr(){
	compadd `_livestr_get_following`
}



compdef _livestr livestr
