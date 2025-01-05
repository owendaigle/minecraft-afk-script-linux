#!/bin/bash

# Original script by codepuncher at http://web.archive.org/web/20240119180244/https://www.reddit.com/r/Minecraft/comments/bu4gka/linux_autoclicker_bash_script_useful_for_afk
# Modified by Owen Daigle

# afk fishing
function fishing() {
  echo "Farming (Right click in Minecraft to stop)"
  echo "Script ending"
  xdotool mousedown --window $window_id 3
}

# mob farming routine
function mobs() {
  while true
  do
    echo "Farming (Press Ctrl+C to stop)"
    xdotool click --window $window_id 1 #attacks
    xdotool mousedown --window $window_id 3 # starts eating
    sleep 2
    xdotool mouseup --window $window_id 3 #stops eating
  done
}

function welcome() {
  echo "MINECRAFT AFK TOOLS"
  echo "To use, please ensure that Minecraft pause on focus loss is OFF"
  echo "Please DO NOT use the escape menu to change to this script, use ALT TAB (to not pause the game)"
  echo
  echo "Please choose AFK mode"
}

####################################################################################

# Get all process IDs that match the window class of "Minecraft"
pids=$(xdotool search --class "Minecraft")

for pid in $pids; do
  name=$(xdotool getwindowname $pid)
  if [[ $name == *"Minecraft"* ]]; then
    # Convert decimal PID to hexadecimal
    window_id=$(printf 0x"%x\n" $pid)

    echo "Found minecraft window"

    # Stop looping
    break
  fi

done

# check flags
if [ $# -ne 0 ]; then #args given so get mode from them
  mode=$1
  echo "Running in $mode mode."
else # no args given so ask user
  welcome
  select mode in "AFK Fishing" "Mob Farming" "Help" "Quit" 
  do
    break
  done
fi

# assign mode
case $mode in
    "AFK Fishing" | fish)
      fishing
    ;;
    "Mob Farming" | mobfarm)
      mobs
    ;;
    "Quit")
      echo "Quitting"
    ;;
    "Help")
      echo "Please read markdown document called README.md for help."
    ;;
    *)
      echo "Unknown Command"
esac


