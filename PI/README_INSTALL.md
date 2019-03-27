prerequisite 
pd - ensure PD is installed and working

if fresh installed, then run pd and configure for soundcard etc 
and also setup for alsa midi with at least one in /out port
(remember to save settings after )
you can review the .pdsettings file supplied, to check for missing elements

this install assumes system is configured for audio, 

===================

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
journalctl -u mec
journalctl -u orac



Configuration
note: as json files do not support comments, I use an _ to comment out alternatives
so if you need the other config, remove the _, and comment out previous setting with _

its important that the correct user is configured in the two services

this install assumes a patchbox OS from blokaslabs.io, but can easily be adapth

mec.service - contains the username/group/homedir - change if necessary
orac.service - contains the username/group/homedir - change if necessary

MEC
if you are using MEC, then you will need to review the midi/devices settings in 
/usr/local/MEC/*.json
also chose the config to use in mec.service

hint:
using aconnect -l to get device names


Orac
/usr/local/orac/orac.json - contains the users home directory, change if using a different user
