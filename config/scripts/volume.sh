#!/bin/sh

case "$1" in
  up)   wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+ ;;
  down) wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%- ;;
  mute) wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle ;;
  mute-mic) wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle ;;
esac

VOLUME=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
MUTED=$(echo "$VOLUME" | grep -c '\[MUTED\]')
LEVEL=$(echo "$VOLUME" | awk '{printf "%.0f", $2 * 100}')
VOLMIC=$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@)
MUTEMIC=$(echo "$VOLMIC" | grep -c '\[MUTED\]')

if [ "$MUTED" -eq 1 ]; then
	if [ "$MUTEMIC" -eq 1 ]; then
	  ICON="audio-volume-muted"
	  MSG="$LEVEL% - Audio/Mic Muted"
	  else
  ICON="audio-volume-muted"
  MSG="$LEVEL% - Audio Muted"
  	fi
else
if [ "$MUTEMIC" -eq 1 ]; then
  ICON="audio-volume-muted"
  MSG="$LEVEL% - Mic Muted"
else
  MSG="$LEVEL%"
  if [ "$LEVEL" -eq 0 ]; then
    ICON="audio-volume-muted"
  elif [ "$LEVEL" -lt 34 ]; then
    ICON="audio-volume-low"
  elif [ "$LEVEL" -lt 67 ]; then
    ICON="audio-volume-medium"
  else
    ICON="audio-volume-high"
  fi
 fi
fi

dunstify -a "volume" -u low -i "$ICON" \
  -h string:x-dunst-stack-tag:volume \
  -h int:value:"$LEVEL" \
  "Volume" "$MSG"
