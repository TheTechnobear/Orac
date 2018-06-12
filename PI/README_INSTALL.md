prerequisite 
pd - sudo apt-get install pd

if fresh installed, then run pd and configure for soundcard etc 
and also setup for alsa midi with at least one in /out port
(remember to save settings after )
you can review the .pdsettings file supplied, to check for missing elements

this install assumes system is configured for audio, 


sudo ./install.sh

installed to 
/usr/local/MEC
/usr/local/orac

services enabled mec orac

see status with 
systemctl status mec 
systemctl status orac 

full logs with journalctl 
e.g. 
journalctl-u mec



Configuration

its important that the correct user is configured in the two services

if you are using MEC, then you will need to review the midi/devices settings in 
/usr/local/MEC/*.json
and determine which config is used in service file


Orac
orac should not need configuring , except users
