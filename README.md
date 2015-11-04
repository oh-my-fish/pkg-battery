<img src="https://dl.dropboxusercontent.com/u/56336/omf/omf-logo-optimised.svg" align="left" width="144px" height="144px"/>

#### Battery
> OS X and Linux compatible battery utility

[![MIT License](https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square)](/LICENSE)
[![Fish Shell Version](https://img.shields.io/badge/fish-v2.2.0-007EC7.svg?style=flat-square)](http://fishshell.com)
[![Oh My Fish Framework](https://img.shields.io/badge/Oh%20My%20Fish-Framework-007EC7.svg?style=flat-square)](https://www.github.com/oh-my-fish/oh-my-fish)

<br/>

## Install

```fish
omf install battery
```

## Usage

Display `battery` slots.

```fish
battery
```

Customize `battery` options.

```fish
battery ▶ ▷
```

Check if the battery is currently charging.

```fish
if set -q BATTERY_IS_CHARGING
  echo Charging ⌁
end
```

### Environment Variables

+ #### `BATTERY_IS_PLUGGED`
Unset if `false`.

+ #### `BATTERY_IS_CHARGING`
Unset if `false`.

+ #### `BATTERY_TIME_LEFT`
Time left in `HH:MM` format.

+ #### `BATTERY_SLOTS`
Number of slots/gauges from 10 available.

+ #### `BATTERY_MAX_CAP`
Battery maximum capacity.

+ #### `BATTERY_CUR_CAP`
Battery current capacity.

+ #### `BATTERY_PCT`
Current battery life in `%`.

### Screenshot

![](https://cloud.githubusercontent.com/assets/8317250/8145972/4e867a12-125a-11e5-8b88-3470d1b39a84.png)

# License

[MIT][mit] © [Jorge Bucaran][author]


[mit]:            http://opensource.org/licenses/MIT
[author]:         http://github.com/bucaran
[omf-link]:       https://www.github.com/oh-my-fish/oh-my-fish
[contributors]:   https://github.com/oh-my-fish/plugin-battery/graphs/contributors
