function battery.info.update.darwin
  set -l ioreg (ioreg -rc "AppleSmartBattery")

  printf "%s"\n $ioreg \
  | grep -q "\"ExternalConnected\" = Yes"
    and set -g BATTERY_IS_PLUGGED
    or set -e BATTERY_IS_PLUGGED

  printf "%s"\n $ioreg \
  | grep -q "\"IsCharging\" = Yes"
    and set -g BATTERY_IS_CHARGING
    or set -e  BATTERY_IS_CHARGING

  set -g BATTERY_MAX_CAP (printf "%s\n" $ioreg \
  | grep "\"MaxCapacity\" =" \
  | sed -e 's/^.*"MaxCapacity"\ =\ //')

  set -g BATTERY_CUR_CAP (printf "%s\n" $ioreg \
  | grep "\"CurrentCapacity\" =" \
  | sed -e 's/^.*CurrentCapacity"\ =\ //')
  set -g BATTERY_PCT (printf "%.1f" \
    (echo "$BATTERY_CUR_CAP / $BATTERY_MAX_CAP * 100" | bc -l))

  set -g BATTERY_TIME_LEFT (printf "%s\n" $ioreg \
  | grep "\"AvgTimeToEmpty\" =" \
  | sed -e 's/^.*"AvgTimeToEmpty"\ =\ //')
  set BATTERY_TIME_LEFT (printf "%02d:%02d" \
    (echo "$BATTERY_TIME_LEFT / 60" | bc) \
    (echo "$BATTERY_TIME_LEFT % 60" | bc))

  set -g BATTERY_SLOTS (math $BATTERY_PCT / 10)
end
