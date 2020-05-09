
PD Client
---------
the PD client will need routeOSC install, 
this is part of 'mrpeach', which can be installed via deken (see find externals in PD menu)


PD Android Client
-----------------
edit main.pd to set correct host (pd GUI)
install PdDroidParty (or MobMuPlat) on your phone
copy files into right dir according to app rquirements
http://droidparty.net/


Lemur Client
------------
install as normal for lemur patches
you will then need to setup the OSC connection on the project preferences

preferences -> Osc Targets

OSC 0 : host <insert hostname> : port 6100


if your using an organelle, hostname will be organelle, or organelle.local
for patchbox its usually patchbox.  (note the full stop) 
if this fails, use the ip address :) 


