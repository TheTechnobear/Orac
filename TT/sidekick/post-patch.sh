#connect to midi to pd process if it exists, so wait for pd to start
sleep 1
#default usb device is on 20:0 but may be different for other devices!
aconnect 20:0 128:0

