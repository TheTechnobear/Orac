#!/bin/sh

. /usr/local/pisound/scripts/common/common.sh

if systemctl status mec | grep -q inactive; then
    echo activating mec;
    systemctl start mec;
    flash_leds 10
else
    echo deactivating mec;
    systemctl stop mec;
    flash_leds 10
    sleep 1
    flash_leds 10
fi