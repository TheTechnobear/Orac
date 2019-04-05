#!/bin/sh

. /usr/local/pisound/scripts/common/common.sh

flash_leds 10
systemctl restart orac
sleep 1
flash_leds 10
sleep 1
flash_leds 10

