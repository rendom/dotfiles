#!/bin/bash

case "$1" in
    up)
        pamixer --increase 4
        ;;
    down)
        pamixer --decrease 4
        ;;
    mute)
        pamixer --toggle-mute
        ;;
esac

VOLUME=$(pamixer --get-volume)
MUTE=$(pamixer --get-mute)

# Show volume with volnoti
if [[ $MUTE == 'true' ]]; then
    notify-send -i audio-volume-muted -t 20 "VOLUME" "Volume:\nMUTED"
else
    case "$VOLUME" in
        [0-9])
            ICON=audio-volume-low-zero
            ;;
        [1-3][0-9])
            ICON=audio-volume-low
            ;;
        [4-6][0-9])
            ICON=audio-volume-medium
            ;;
        [7-9][0-9])
            ICON=audio-volume-high
            ;;
        *)
            ICON=audio-volume-high
            ;;
    esac

    notify-send -i $ICON -t 20 "VOLUME" "Volume:\n%p$VOLUME%"
fi
