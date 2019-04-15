#!/bin/sh

export USER_DIR=${USER_DIR:="/usbdrive"}
# PATCH_DIR=${PATCH_DIR:="/usbdrive/Patches"}
# FW_DIR=${FW_DIR:="/root"}
# SCRIPTS_DIR=$FW_DIR/scripts

# should be run from motherhost package installer

oscsend localhost 4001 /oled/aux/line/2 s "install orac"
oscsend localhost 4001 /oled/aux/line/3 s "installing..."

mkdir -p ${USER_DIR}/media/orac/usermodules
cp -nr media $USER_DIR
cp -r data $USER_DIR
oscsend localhost 4001 /oled/aux/line/3 s "done"

exit 0
