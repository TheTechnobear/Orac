/*
Default Template : Mark Harris (aka TheTechnobear)
This is an example of the what you might need for your supercollider patch on the Norns
It shows recommended server options and incoming messages from norns via osc
Note: if you want to do live coding/interaction from your remote computer, look at the live coding template

usage:
- copy template to use as starting point for new your patch
- implement OSCdef that you want to use
- remove OSCdef you do not need
*/


/* incoming messages
NUI OSC messages received /ttui prex
button  num value
pot num value
trig  num value

(from sk/deviceInfo)
numencoders value
numbuttons value

SK OSC messages received /sk prefix
stop
start
stopPatch
update
powerOff
activateItem

*/


/* outgoing messages

ttui messages , prefix /ttui : TTuiDevice.h is ultimate guide ;)

gateOut 
ledOut

displayPaint (must be sent for display to be rendered
displayClear

gClear -  clr
gSetPixel -  clr,  x,  y
gFillArea -  clr,  x,  y,  w,  h
gCircle -  clr,  x,  y,  r
gFilledCircle -  clr,  x,  y,  r
gLine -  clr,  x1,  y1,  x2,  y2
gRectangle -  clr,  x,  y,  w,  h
gInvert
gText -  clr,  x,  y, str
gWaveform -  clr, wave (osc blob) 128 values 0..64
gInvertArea -  x,  y,  w,  h
gPng -  x,  y, filename

textLine -  clr,  line, col,  str
invertLine -  line
clearLine-  clr,  line

sk messages - prefix /sk
stopPatch
deviceInfo

*/

~sidekick = NetAddr("127.0.0.1", 3001); // sidekick

s.waitForBoot{
	"Default patch".postln;
	~sidekick.sendMsg("/ttui/displayClear",0);
	~sidekick.sendMsg("/ttui/textLine",0,15,0,0,"Default Patch");
	~sidekick.sendMsg("/ttui/displayPaint");
};

// ~sidekick.sendMsg("/sk/deviceInfo");


// - knobs/buttons are received via osc, see OSCdef below
// - audio input/output  - normal SC, use SoundIn.ar, Out.ar , as normal
// - audio files - normal SC, use SoundFile.collect("/home/we/audio/*"), then use Buffer.read
// e.g.
// ~audio_files.SoundFile.collect("/home/we/audio/*")
// z=Buffer.read(s,audio_files[0]);

//OSCdef to receive knobs/buttons from norns

(
~rPort=3000;

// messages coming from the norns
OSCdef( \osc_pot, {
	arg msg, time, addr, recvPort;
	msg.postln;
},
'/ttui/pot',recvPort:~rPort);

OSCdef( \osc_button, {
	arg msg, time, addr, recvPort;
	msg.postln;
},
'/ttui/button',recvPort:~rPort);

OSCdef( \osc_numencoders, {
	arg msg, time, addr, recvPort;
	msg.postln;
},
'/ttui/numencoders',recvPort:~rPort);

OSCdef( \osc_numbuttons, {
	arg msg, time, addr, recvPort;
	msg.postln;
},
'/ttui/numbuttons',recvPort:~rPort);

)

