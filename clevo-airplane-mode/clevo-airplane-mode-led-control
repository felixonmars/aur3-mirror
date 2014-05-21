#!/bin/bash

WIFI_RF_INDEX=$(rfkill list wifi | head -1 | cut -d ':' -f1)
LED_PATH='/sys/class/leds/tuxedo::airplane/brightness'
RFKILL_STATE="/sys/class/rfkill/rfkill${WIFI_RF_INDEX}/state"
LED_STATE=0

if [ $(cat "$RFKILL_STATE") == '0' ]; then
	LED_STATE=1
fi

echo "$LED_STATE" > "$LED_PATH"
