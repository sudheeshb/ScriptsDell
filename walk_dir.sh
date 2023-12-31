#!/bin/bash

walk_dir () {    
    shopt -s nullglob dotglob

    for pathname in "$1"/*; do
        if [ -d "$pathname" ]; then
            walk_dir "$pathname"
        else
            case "$pathname" in *.mkv|*.mp4)
		    name="${pathname%.*}"	    
                    printf '%s\n' "$pathname"
		    echo $name
		    ffmpeg -ss 00:01:00 -i "$pathname" -loglevel 40 -frames 1 -bt 20M -vf "drawtext=fontfile=/usr/share/fonts/open-sans/OpenSans-Light.ttf:timecode='00\\:00\\:00\\:00':r=30:fontsize=40:fontcolor=white:x=10:y=10:box=1:boxcolor=black@0.5,select=not(mod(n\,4500)),scale=640:480,tile=3x3" -n "${name}.jpg"
            esac
        fi
    done
}


DOWNLOADING_DIR=$PWD


walk_dir "$DOWNLOADING_DIR"
