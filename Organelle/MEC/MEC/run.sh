#!/bin/bash

USER_DIR=${USER_DIR:="/usbdrive"}
#PATCH_DIR=${PATCH_DIR:="${USER_DIR}/Patches"}
export FW_DIR=${FW_DIR:="/root"}
SCRIPTS_DIR=$FW_DIR/scripts
WORK_DIR=${WORK_DIR:="${USER_DIR}"}

cd $WORK_DIR

MEC_APP=./mec-app

# encoder wheel is ignored (until /gohome is called at end of script)
oscsend localhost 4001 /enableauxsub i 1

# clear aux screen
oscsend localhost 4001 /oled/aux/clear i 1
oscsend localhost 4001 /oled/setscreen i 1


oscsend localhost 4001 /oled/aux/line/1 s "MEC"
oscsend localhost 4001 /oled/aux/line/5 s "Press to express"

X=0
CONFIG="STOP"
oscsend localhost 4001 /oled/aux/line/3 s "Config: $CONFIG"

while read line; do
        
    if [ "$line" == "/encoder/turn i 0" ]
    then
        X=$(($X-1))
        if (( $X < 0 )); then
            X=0
        fi

        if (( $X == 0)); then
            CONFIG="STOP"
        else
            CONFIG=`ls *.json |sed "${X}q;d"`
        fi
        oscsend localhost 4001 /oled/aux/line/3 s "Config: $CONFIG "
    fi
    
    if [ "$line" == "/encoder/turn i 1" ]
    then 
        X=$(($X+1))
        
        CONFIG=`ls *.json |sed "${X}q;d"`
        if [ -z "$CONFIG" ]; then
            X=$(($X-1))
            CONFIG=`ls *.json |sed "${X}q;d"`
        fi
        oscsend localhost 4001 /oled/aux/line/3 s "Config: $CONFIG "
    fi

    if [ "$line" == "/encoder/button i 1" ]
    then 
        killall mec-app
        
        oscsend localhost 4001 /oled/aux/clear i 1
        oscsend localhost 4001 /oled/aux/line/1 s "MEC"
        if (( $X == 0)); then
            oscsend localhost 4001 /oled/aux/line/3 s "Stopped"
        else 
            echo "${MEC_APP} $CONFIG"
            ${MEC_APP} ${WORK_DIR}/$CONFIG &
            oscsend localhost 4001 /oled/aux/line/3 s "Running $CONFIG"
        fi
        
        oscsend localhost 4001 /enableauxsub i 0
        break 2
    fi
done < <($SCRIPTS_DIR/oscdump2 4002)

killall oscdump2
sleep 2

#oscsend localhost 4001 /gohome i 1
oscsend localhost 4001 /oled/setscreen i 2


