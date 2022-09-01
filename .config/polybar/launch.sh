#!/bin/bash
killall -q polybar

while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

polybar i3poly &

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload i3poly &
  done
else
  polybar --reload i3poly &
fi


