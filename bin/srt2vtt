#!/bin/sh

srt2vtt() {
        SRT="$1"
        CHARSET=$(file -bi $1 | awk -F= '{ print $2 }')
        VTT="${SRT%.*}".vtt
        echo -e "WEBVTT\n" > $VTT
        if [ "${CHARSET}" = "utf-8" ]; then
                cattool=cat
        else
                cattool="iconv -f ${CHARSET} -t utf-8"
        fi
        set -x
        $cattool $SRT | sed -e '/[0-9][0-9]:[0-9][0-9]:[0-9][0-9],[0-9][0-9][0-9] --> [0-9][0-9]:[0-9][0-9]:[0-9][0-9],[0-9][0-9][0-9]/s/,/./g' -e "s/^M//g" >> $VTT
}

srt2vtt $1
