#!/bin/bash
# Script to convert video files to GIFs using ffmpeg

FFMPEG_PATH=$(which ffmpeg)
if [[ -z FFMPEG_PATH ]]; then
    echo "FATAL: ffmpeg was not found in your path - please install beforehand"
    exit 1
fi

FPS=10
SCALE=1
CUTOFF=0
FULLPATH=

function usage() {
    echo "Usage: $0 [-f|--fps <fps>] [-s|--scale <scale>] file"
    echo
    echo "Arguments:"
    echo "      file            File to convert to GIF"
    echo "Options:"
    echo "      -h|--help       Print this help"
    echo "      -f|--fps        Framerate (FPS) to use for GIF (default: 10)"
    echo "      -s|--scale      Scale ratio to use during conversion - will be used as 1/x,"
    echo "                      i.e. a scale of 2 will result in half the size (default: 1)"
    echo "      -c|--cutoff     Number of seconds to cut off at the end (default: 0)"
    exit $1
}

while [[ $# -gt 0 ]]; do
    KEY=$1

    case $KEY in
        -h | --help)
            usage 0
            ;;
        -f | --fps)
            FPS=$2
            shift
            ;;
        -s | --scale)
            SCALE=$2
            shift
            ;;
        -c | --cutoff)
            CUTOFF=$2
            shift
            ;;
        *)
            if [[ $# -eq 1 ]]; then
                FULLPATH=$KEY
                shift
            else
                echo "ERROR: Unknown option: $KEY"
                echo
                usage 1
            fi
            ;;
    esac

    shift
done

if [[ -z $FULLPATH ]]; then
    echo "Required argument file is missing"
    echo
    usage 1
fi
if [[ ! -e $FULLPATH ]]; then
    echo "File $FULLPATH does not exist"
    echo
    usage 1
fi

FILENAME=${FULLPATH%%.*}
GIF="${FILENAME}.gif"
PALETTE="${FILENAME}-palette.png"

echo "Converting $FULLPATH to $GIF..."

FILTERS="fps=$FPS,scale=iw/$SCALE:ih/$SCALE:flags=lanczos"

if [[ $CUTOFF -gt 0 ]]; then
    DURATION=$(ffprobe -loglevel quiet -of compact=p=0:nk=1 -show_entries format=duration -i "$FULLPATH")
    DURATION_DIFF=$(echo "$DURATION - $CUTOFF" | bc -l)

    ffmpeg -v warning -i $FULLPATH -vf "$FILTERS,palettegen" -t $DURATION_DIFF -y $PALETTE

    ffmpeg -v warning -i $FULLPATH -i $PALETTE -t $DURATION_DIFF -lavfi "$FILTERS [x]; [x][1:v] paletteuse" -y $GIF
else
    ffmpeg -v warning -i $FULLPATH -vf "$FILTERS,palettegen" -y $PALETTE

    ffmpeg -v warning -i $FULLPATH -i $PALETTE -lavfi "$FILTERS [x]; [x][1:v] paletteuse" -y $GIF
fi

rm $PALETTE

echo "Done - see output $GIF"
