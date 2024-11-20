#!/bin/bash

Date() {
    x=$(date '+%a %b %D')
    echo $x
}

Time() {
    x=$(date '+%I:%M %p')
    echo $x
}

Batt() {
  status=$(cat /sys/class/power_supply/BAT1/status)
  capacity=$(cat /sys/class/power_supply/BAT1/capacity)

  case $status in
    Charging)
      echo -e "CHR +$capacity%";;
    Discharging)
      echo "BAT $capacity%";;
    *)
      echo "BAT $capacity%";;
  esac
}

Bar() {
    echo "[ $(Batt) ] [ $(Time) ] [ $(Date) ]"
}

# event loop
while :
do
    sleep 5
    xsetroot -name "$(Bar)"
done
