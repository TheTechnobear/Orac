#!/bin/sh

export USER_DIR=${USER_DIR:="/usbdrive"}
# PATCH_DIR=${PATCH_DIR:="/usbdrive/Patches"}
# FW_DIR=${FW_DIR:="/root"}
# SCRIPTS_DIR=$FW_DIR/scripts

# should be run from motherhost package installer


grep -q 'ID=archarm' /etc/os-release;
if [ ! $? -eq 0 ]
then
	# organelle-m add udev rules, not needed for o-1 since its root!
	sudo cp $INSTALL_DIR/*.rules /etc/udev/rules.d
	sudo udevadm control --reload-rules
fi



oscsend localhost 4001 /oled/aux/line/2 s "install MEC "
oscsend localhost 4001 /oled/aux/line/2 3 "into Extras"
INSTALL_DIR=$USER_DIR/System/MEC

mkdir -p $USER_DIR/System
rm -rf $INSTALL_DIR
mv MEC $INSTALL_DIR
chmod a+x $INSTALL_DIR/mec-app
chmod a+x $INSTALL_DIR/*.so
chmod a+x $INSTALL_DIR/*.pd_linux


cd ..
rm -rf $1

exit 0
