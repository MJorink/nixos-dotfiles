#!/bin/sh

case "$1" in
  up)   brightnessctl set 5%+ ;;
  down) brightnessctl set 5%- ;;
esac

MAX=$(brightnessctl max)
CUR=$(brightnessctl get)
LEVEL=$(awk "BEGIN {printf \"%.0f\", ($CUR / $MAX) * 100}")

if [ "$LEVEL" -lt 34 ]; then
  ICON="display-brightness-low"
elif [ "$LEVEL" -lt 67 ]; then
  ICON="display-brightness-medium"
else
  ICON="display-brightness-high"
fi

dunstify -a "brightness" -u low -i "$ICON" \
  -h string:x-dunst-stack-tag:brightness \
  -h int:value:"$LEVEL" \
  "Brightness" "$LEVEL%"
