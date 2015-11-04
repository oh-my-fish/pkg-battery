# NAME
#   battery [arguments]
#
# SYNOPSIS
#   OS X and Linux compatible battery utility.
#
# USAGE
#   if available battery
#     battery
#   end
#
# ENV
#   BATTERY_IS_PLUGGED
#   BATTERY_IS_CHARGING
#   BATTERY_TIME_LEFT     Time left in `HH:MM` format.
#   BATTERY_SLOTS         Number of slots/gauges in base 10.
#   BATTERY_MAX_CAP       Battery maximum capacity.
#   BATTERY_CUR_CAP       Battery current capacity.
#   BATTERY_PCT           Current battery life in %.
#
# ARGUMENTS
#   filled_slot_char    ▮
#   empty_slot_char     ▯
#   show_empty_slots  true

function battery -a filled_slot_char \
                    empty_slot_char  \
                    show_empty_slots \
                    red yellow green

  test -z "$filled_slot_char";
    and set filled_slot_char ▮

  test -z "$empty_slot_char";
    and set empty_slot_char ▯

  test -z "$show_empty_slots";
    and set show_empty_slots true

  test -z "$red";
    and set red (set_color -o f00)

  test -z "$yellow";
    and set yellow (set_color -o ff0)

  test -z "$green";
    and set green (set_color -o 0f0)

  set -l normal   (set_color normal)
  set -l color    $green

  battery.info.update

  switch $BATTERY_SLOTS
    case 0 1 2; set color $red
    case 3 4;   set color $yellow
  end

  for n in (seq 10)
    if test $n -le $BATTERY_SLOTS
      printf "$color$filled_slot_char$normal"
    else
      if test $show_empty_slots = true
        printf "$color$empty_slot_char$normal"
      end
    end
  end

end
