## Technobear's Orac virtual modular 


Orac is a virtual modular based on Pure Data , utilising externals (KontrolRack/KontrolModule) from my MEC projects.

Its is designed to be easy to use on lightweight computing platforms, and provides features such as Presets and Midi Learn.

As well as being flexible for users, its is designed to be is for 'Module Patchers' to create new modules, and thus extend the ecosystem.


### Videos
A couple of views have been made, which help show Orac , and how to use it.

https://youtu.be/-m8p9E-WGWE
https://youtu.be/raTvethmcqc
https://youtu.be/ilHzy4mNu3w
https://youtu.be/Z1fYYE622Iw


### Platforms
The code is cross-platform, and I run it on the Organelle, Raspeberry PI and Bela.
(also for development purposes I run it on macOS)


### Building
This projects contains the Pure Data aspects of Orac, as mentioned above it utilises MEC
MEC can be found/built here : https://github.com/TheTechnobear/MEC
MI externals (used in some modules) can be found here: https://github.com/TheTechnobear/Mi4Pd

for each platform there is a 'create' package script, in scripts
so to create for Organelle, you would youse
./scripts/create_organelle.sh
this will create a 'package' in ./pkg, e.g. ./pkg/organelle
depending on platform the result of this will vary e.g. might be a zop, a debian package ,or pacman
note: I only support building on the target platform


### Release
I release 'builds' of Orac on PatchStorage.com


### Contribution
This is an open source project, and Im happy if others would like to collaborate/extend etc.
Generally Id recommend contacting me first, so we can co-ordinate efforts, but Im also willing to review Pull Requests.


### Credits:
Id like to extend  thanks to open source developers who make these kinds of projects possible, 
and special thanks to Critter and Guitari for open sourcing their wonderful patches which I have 'modularised', similarly Id extend the same thanks to Mutable Instruments whos code I have used to create PD externals for use in Modules in Orac.

### Project Structure
Core - files which do not differ from platform to platform
Organelle - Organelle specific files, including build libs/externals
Bela - Bela specific files, including build libs/externals
PI - PI specific files, including build libs/externals
Nebulae
Salt
patchbox
OscClients - various clients for use with MEC oscdisplay

scripts/create_* - script which creates a package in the pkg directory, from combining above folders


Happy Patching 

Mark Harris aka TheTechnobear
