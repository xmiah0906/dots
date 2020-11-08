#!/bin/bash

# Simple Screen Capture

program_name_="ssc"

function print_help() {
  printf "$program_name_ - Captures screen\n"
  printf "\n"
  printf "SYNOPSYS\n"
  printf "    $program_name_ [OPTIONS] \n"
  printf "OPTIONS:\n"
  printf "    -h|--help\n"
  printf "        Print this help.\n"
  printf "    -s|--no-sound source\n"
  printf "        Disables the sound capture for {source}. Argument is either\n"
  printf "        'monitor' (audio monitoring) or 'device' (input device).\n"
  printf "    --rtmp\n"
  printf "        The output is rtmp stream.\n"
  printf "    -o|--out {destination}\n"
  printf "        The destination to output the video to (file, rtmp url, etc.).\n"
  printf "    -a|--audio-device {device}\n"
  printf "        The audio device.\n"
  printf "    -v|--video_size {geometry}\n"
  printf "        Video geometry (format: WxH). This is passed to ffmpeg's -s\n"
  printf "        argument.\n"
  printf "    --no-mix\n"
  printf "        Disable audio mixing. All audio is recorded on different tracks.\n"
  printf "    -f|--offset {offset}\n"
  printf "        Video offset of the display origin point (format: W,H).\n"
}

options='hv:c:s:f:o:a:' loptions='help,video-size:,rtmp,offset:,no-sound:,out:,audio-device:,no-mix'
getopt_out=$(getopt --name $program_name_ --options $options --longoptions $loptions -- "$@")
if (( $? != 0 )); then exit 1; fi

#sets the positionnal parameters with getopt's output
eval set -- "$getopt_out"

# default args
video_size=$(xrandr -q | grep -m 1 -E "*\*\+" | gawk '{print $1}')
video_offset=0,0
out=out.mkv
audio_device=1
audio_mixed=true
x11_options=
rtmp=false
while [[ $1 != "--" ]]; do
  case "$1" in
    -h|--help)
      print_help
      exit 0
      ;;
    -s|--no-sound)
      nosound=$2
      shift 2
      ;;
    -o|--out-file)
      out="$2"
      shift 2
      ;;
    -a|--audio-device)
      audio_device=$2
      shift 2
      ;;
    --no-mix)
      audio_mixed=false
      shift
      ;;
    --rtmp)
      rtmp=true
      shift 1
      ;;
    -v|--video_size)
      video_size=$2
      shift 2
      ;;
    -f|--offset)
      video_offset=$2
      shift 2
      ;;
  esac
done

# shift away from the last positionnal parameter (--)
shift

FRAMERATE=30
DISPLAY=:0.0
VIN="${DISPLAY}+${video_offset}"
AUDIO_MONITOR='alsa_output.pci-0000_00_1b.0.analog-stereo.monitor'

# set flv container before output
if ${rtmp}; then
  out="-f flv ${out}"
fi

function ffmpeg_vinput() {
  ffmpeg -f x11grab $x11_options -framerate $FRAMERATE -s $video_size -i $VIN \
    "$@" \
    -c:v libx264 -preset "ultrafast" -qp 0 -y $out </dev/null
}

function ffmpeg_vinput_ainput() {
  ffmpeg_vinput -f pulse -i $audio_device "$@"
}

function ffmpeg_vinput_amonitor() {
  ffmpeg_vinput -f pulse -i "$AUDIO_MONITOR" "$@"
}

function ffmpeg_vinput_ainput_amonitor() {
  ffmpeg_vinput_ainput -f pulse -i "$AUDIO_MONITOR" "$@"
}

function ffmpeg_vinput_ainput_amonitor_mix() {
  ffmpeg_vinput_ainput_amonitor "$@" -map 0 -map 1 -map 2
}

if [[ "$nosound" == "all" ]]; then
  ffmpeg_vinput
elif [[ "$nosound" == "monitor" ]]; then
  ffmpeg_vinput_ainput -map 0 -map 1
elif [[ "$nosound" == "device" ]]; then
  ffmpeg_vinput_amonitor -map 0 -map 1
else
  if $audio_mixed; then
    ffmpeg_vinput_ainput_amonitor_mix -filter_complex amix
  else
    ffmpeg_vinput_ainput_amonitor_mix
  fi
fi

# vim:set et sw=2 ts=2 tw=120:
