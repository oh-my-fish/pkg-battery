function battery.info.update.linux
  if not available upower
    echo "Please install upower"
    return 1
  end

  set -l devices (upower -e | grep battery)
  set -l upo (upower -i $devices)

  printf "%s"\n $upo | grep -q "charging"
  and set -g BATTERY_IS_PLUGGED

  set -g BATTERY_MAX_CAP (printf "%s\n" $upo \
  | grep "energy-full:" \
  | cut -d ":" -f 2)

  set -g BATTERY_CUR_CAP (printf "%s\n" $upo \
  | grep "energy:" \
  | cut -d ":" -f 2)

  set -g BATTERY_PCT (printf "%s\n" $upo \
  | grep "percentage:" | cut -d":" -f2 | cut -d"%" -f1)

  set -g BATTERY_TIME_LEFT (printf "%s\n" $upo \
  | grep "time to" \
  | cut -d":" -f 2)

  set -g BATTERY_SLOTS (math $BATTERY_PCT / 10)
end
