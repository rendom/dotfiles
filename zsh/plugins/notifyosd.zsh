# commands to ignore
cmdignore=(
    pacmixer
    vimdir
    zathura
#    htop
    tmux
#    top
    vim
    sxiv
    wine
    ncmpcpp
    weechat-curses
    rtorrent
    weechat
    rt
    mutt
    ssh
    mpv
    journalctl
    watch
    tail
    man
    ping
    livestreamer
    youtube-viewer
)

function human_time() {
    local tmp=$1
    local years=$(( tmp / 60 / 60 / 24 / 365))
    local months=$(( tmp / 60 / 60 / 24 / 30))
    local days=$(( tmp / 60 / 60 / 24 ))
    local hours=$(( tmp / 60 / 60 % 24 ))
    local minutes=$(( tmp / 60 % 60 ))
    local seconds=$(( tmp % 60 ))
    (( $years > 0 )) && echo -n "${years} years "
    (( $months > 0 )) && echo -n "${months} months "
    (( $days > 0 )) && echo -n "${days} days "
    (( $hours > 0 )) && echo -n "${hours} hours "
    (( $minutes > 0 )) && echo -n "${minutes} minutes "
    echo "${seconds} seconds"
}

# end and compare timer, notify-send if needed
function notifyosd-precmd() {
    retval=$?
    if [[ ! -f /usr/bin/notify-send ]];then
        return
    fi

    if [[ ${cmdignore[(r)$cmd_basename]} == $cmd_basename ]]; then
        return
    else
        if [ ! -z "$cmd" ]; then
            cmd_end=`date +%s`
            ((cmd_time=$cmd_end - $cmd_start))
        fi
        if [ $retval -gt 0 ]; then
            cmdstat="with warning"
            sndstat="/usr/share/sounds/gnome/default/alerts/sonar.ogg"
            icon='status/dialog-error'
            stat="critical"
        else
            cmdstat="successfully"
            sndstat="/usr/share/sounds/gnome/default/alerts/glass.ogg"
            icon='status/dialog-information'
            stat="normal"
        fi
        if [ ! -z "$cmd" -a $cmd_time -gt 10 ]; then
            time_string="$(human_time $cmd_time)"
            if [ ! -z $SSH_TTY ] ; then
                title="$cmd_basename on `hostname` completed $cmdstat"
                notify-send -i $icon -u $stat \
                    "$title" \
                    "<b>$title</b>\n$cmd\n\n$time_string\n"
                #play -q $sndstat
            else
                title="$cmd_basename completed $cmdstat"
                notify-send -i $icon -u $stat \
                    "$title" \
                    "<b>$title</b>\n$cmd\n$time_string\n"
                #play -q $sndstat
            fi
        fi
        unset cmd
    fi
}

# make sure this plays nicely with any existing precmd
precmd_functions+=( notifyosd-precmd )

# get command name and start the timer
function notifyosd-preexec() {
    cmd=$1
    cmd_basename=${${cmd:s/sudo //}[(ws: :)1]}
    cmd_start=`date +%s`
}

# make sure this plays nicely with any existing preexec
preexec_functions+=( notifyosd-preexec )
