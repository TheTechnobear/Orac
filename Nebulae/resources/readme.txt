the details below are also included on videos on my youtube channel
https://youtube/c/thetechnobear

(subcribe for more demos, tutorials, and other patches :) )


I hope you enjoy Orac


Mark  aka TheTechnobear


Orac installation 
-----------------

Orac is a litle bit more than a simple patch se there are a couple of easy steps required.
(note: Ive included the wifi-instrument previously releasd as part of Orac, since most will need it!)


Preparation of USB stick
========================
a) copy ALL files to USB stick (except readme.txt, and wifi.txt)
you need to copy the contents of this zip file (excluding this, and the wifi.txt if you wish ) to your USB drive.

b) renaming instruments/pd file 
you may want to rename each of the instruments so that you know which position it is going to appear in, in the user and pure data banks

e.g. 
mec.inst -> a-mec.inst
pkginstaller.inst -> b-pkginstaller.inst
wifi.instr -> c-wifi.instr

orac.pd -> a-orac.pd

(wifi.instr is optional, for oracs purposes since starting MEC still start wifi automatically)

c) configure wlan-wifi
as you will want to configure Orac via a wifi interface you need to put your WIFI network name and password in the wlan0-wifi file.
(see wifi.txt for more details) 

Nebulae install
========================

d) insert USB stick into Nebulae, and reboot (so usb files are copied)

e) install packages 
since, the nebulae OS currently does not support installation of binaries, we need to now run the
package installer, Ive supplied (pkginstaller.instr)
(if you followed my above renaming, it will be in slot 2 of the userbank)

this only needs to be done ONCE. 
after this has been done, you can safely remove pkginstaller.instr if you wish.


OK, thats it, all should now be installed :) 

--------------------------------------


Starting Orac.
==============

simply go to the PURE DATA bank and select orac patch

to do this hold down SPEED encoder for 5 seconds, until you get 4 leds
then turn it RIGHT for the pure data bank
if you put in slot A , then press first button to select it then press the SPEED encoder to run.
(more details in nebulae user manual)


Remote inteface
===============

to start on Nebulae, select the USER bank and select the MEC instr

to do this hold down SPEED encoder for 5 seconds, until you get 4 leds
then turn it LEFT  for the user bank
if you put in slot A , then press first button to select it then press the SPEED encoder to run.
(more details in nebulae user manual)

doing this will stop any other patch, so it makes sense to do this before starting Orac if you need it, 
but for best performance only start MEC/wifi if you need it for customising your presets.



Remote OSC Clients
==================
once you've started MEC/Orac you will need a remote client either for your phone or computer, 
to interact with Orac, 

these can be downloaded from 
https://patchstorage.com/orac-remote-control-patches/

there is a readme file in the zip you download :) 









