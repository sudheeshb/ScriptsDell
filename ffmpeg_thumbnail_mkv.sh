find . -type f -name '*.mkv' -exec sh -c '
    name="${1%.*}"
    echo "$name"
   ffmpeg -ss 00:01:00 -i "$1" -loglevel 40 -frames 1 -bt 20M -vf "drawtext=fontfile=/usr/share/fonts/open-sans/OpenSans-Light.ttf:timecode='00\\:00\\:00\\:00':r=30:fontsize=40:fontcolor=white:x=10:y=10:box=1:boxcolor=black@0.5,select=not(mod(n\,4000)),scale=640:480,tile=3x3" -n "${name}.jpg"

' find-sh {} \;


#for i in *.mp4; do ffmpeg -ss 100 -i "$i" -frames 5 -vf "select=not(mod(n\,3000)),scale=320:240,tile=4x3" -vsync vfr -q:v 10 "$i"_%03d.jpg; done;
