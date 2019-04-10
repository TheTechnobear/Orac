Nebulae Wifi instrument

this instrument will connect to your wifi when you start it

BEFORE copying to your usb drive
edit wlan0-wifi with a TEXT editor , one that does not add special characters!

you need to change 2 lines
ESSID=YourWifiNetworkName
Key=YourWifiPassword

add your wifi network name and password :) 



now copy your both files to your USB drive, 
- insert into usb drive into nebulae 
- powerup nebulae

- now run the new instrument (in the userbank)
- then switch back to one of the factory instruments
you should find your nebulae on your wifi network, under the name 'alarmpi'
(you can now use ssh to login to it , with user name alarm) 


when you reboot your nebulae the wifi will be off... 
just select the wifi instrument as before ( you do not need usbstick inserted) to start it.


(wifi can affect audio performance so its better to start it when you need it, it also may increase boot times on some networks)


Hope this is useful 

Mark aka TheTechnobear

(Important note: on 2.1.1, Ive found its best NOT to reboot the nebulae with a user instrument selected ;) ) 

---------------------------------------------

notes: 
- if you later need to change your network details, simply re-edit the wlan0-wifi file, and reload from usb, it will automatically copy new details.

- if you would prefer wifi is enabled every time you start (not recommended) 

CAREFULLY change the line in wifi.instr 
          echo alarm | sudo -S netctl start wlan0-wifi
to 
          echo alarm | sudo -S netctl enable wlan0-wifi

this will make wifi start every time your nebulae starts, 
so you no longer need the wifi script to be present.

if you want to disable wifi, run script with it set to.
          echo alarm | sudo -S netctl disable wlan0-wifi

(then you could reinstall with start if you wish) 



