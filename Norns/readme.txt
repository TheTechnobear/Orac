Orac on Norns
=============

BETA ONLY

#Installation

Orac is distributed as two standard debian packages , both need installing

so copy these to your norns machine:

then:

you will need access to the internet, to get dependent packages etc, so make sure your wifi is connected

a) update APT directory - this is standard practice when installing deb packages

sudo apt update  


b) install - mec/orac

sudo sudo apt-get install -y ./mec.deb ./orac.deb


on first install this will install puredata and a few other packages.
you can use the above also to update mec/orac with future releases, these then will not required internet access
as the dependent packages are already installed



# Running MEC/Orac 
c) Running mec/orac

ONLY REQUIRED DURING BETA TEST PHASE
for release, Orac will be launched via the 'Launcher App',
but this is not available yet, so we will run manualll 

i) first STOP norns ;) 
~/norns/stopall.sh

ii) start mec and orac
sudo systemctl start mec orac 

screen may take a couple of seconds to populate... and you will hear a drum beat.
(this is the default demo1 preset running, you can change this ;) ) 


# Using Orac

see my orac videos on 
https://youtube.com/c/thetechnobear
the UI is basically the same as the Organelle

UI 

you start on the parameter display 

the top line tells you the module and the page of the module
to change parameters on the page, use enc 1 to 4
but 1 = param/menu
but 2 = aux (not in this release)

but 3 = function see below 
to switch pages on the module , hold but 3, and turn encoder 3
to switch module, hold but 3, and turn encoder 3

to enter the main menu display press but 1
use enc 1 to scroll, and but 3 to select items
use enc 1 to exit menu
(note:the menu also automatically closes after about 15 seconds)


# Other Notes 
##stopping mec/orac
sudo systemctl stop mec orac 


##debugging/logs for mec/orac

mec and orac are exposed as systemctl services, you can find thier status (running or not) with
sudo systemctl status mec orac 

or to look at the logs use journalctl
journalctl -u orac
journalctl -u mec

you could redirect to a file, if you want to share

journalctl -u mec > mec.txt


## midi devices 
it is recommend you use amidiauto to ensure that midi devices are connected to Pure Data automatically

