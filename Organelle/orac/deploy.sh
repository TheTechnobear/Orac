#!/bin/sh

export USER_DIR=${USER_DIR:="/usbdrive"}
# PATCH_DIR=${PATCH_DIR:="/usbdrive/Patches"}
# FW_DIR=${FW_DIR:="/root"}
# SCRIPTS_DIR=$FW_DIR/scripts

# should be run from motherhost package installer

oscsend localhost 4001 /oled/aux/line/2 s "install orac"

cp -nr media $USER_DIR
cp -nr data $USER_DIR

exit 0
