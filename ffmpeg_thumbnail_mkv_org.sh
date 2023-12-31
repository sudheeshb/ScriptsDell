find . -type f -name '*.mkv' -exec sh -c '
    name="${1%.*}"
    echo "$name"
    ffmpeg -ss 00:02:00 -t 00:30:00 -i "$1" -frames 5 -vf "select=not(mod(n\,4000)),scale=640:480,tile=3x3" -vsync vfr -q:v 10 "$name"_%02d.jpg;

' find-sh {} \;


#for i in *.mp4; do ffmpeg -ss 100 -i "$i" -frames 5 -vf "select=not(mod(n\,3000)),scale=320:240,tile=4x3" -vsync vfr -q:v 10 "$i"_%03d.jpg; done;
