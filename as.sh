#!/bin/bash
for i in *{mp4,mkv};
    do name=`echo "$i" | cut -d'.' -f1`
    echo "$name"
   ffmpeg -ss 00:01:00 -i "$i" -loglevel 40 -frames 1 -bt 20M -vf "drawtext=fontfile=/usr/share/fonts/open-sans/OpenSans-Light.ttf:timecode='00\\:00\\:00\\:00':r=30:fontsize=40:fontcolor=white:x=10:y=10:box=1:boxcolor=black@0.5,select=not(mod(n\,4000)),scale=640:480,tile=3x3" -n "${name}.jpg"

done
