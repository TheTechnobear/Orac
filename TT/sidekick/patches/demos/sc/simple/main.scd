~sidekick = NetAddr("127.0.0.1", 3001); // sidekick

~pitch = 440;
~amp = 0.5;

~dict = Dictionary.new;
~dict.add(\pitch -> ~pitch);
~dict.add(\amp -> ~amp);


s.waitForBoot{
	"Simple Synth".postln;
	~sidekick.sendMsg("/ttui/displayClear",0);
	~sidekick.sendMsg("/ttui/textLine",0,15,0,0,"Simple Patch");
	~sidekick.sendMsg("/ttui/displayPaint");



	SynthDef(\testSynth, {
		arg freq =440,amp = 0.5;
		var sig;
		sig = Saw.ar(freq);
		sig = sig * amp;
		Out.ar(0,sig!2);
	}).add;

	s.sync;

	~synth=Synth.new(\testSynth,~dict.asPairs);

};

(
OSCdef( \osc_pot, {
    arg msg, time, addr, recvPort;
	switch(msg[1],
		0,{
			~pitch = ~pitch + ((msg[2].asFloat / 4096) * 100);
			~synth.set(\freq, ~pitch);
			~sidekick.sendMsg("/ttui/clearLine",0,0,1);
			~sidekick.sendMsg("/ttui/textLine",0,15,1,0,"Freq " ++ ~pitch.asString);
			~sidekick.sendMsg("/ttui/displayPaint");
		},
		1,{
			~amp = ~amp + ((msg[2].asFloat/4096)  * 0.5);
			~synth.set(\amp, ~amp);
			~sidekick.sendMsg("/ttui/clearLine",0,0,2);
			~sidekick.sendMsg("/ttui/textLine",0,15,2,0,"Amp " ++ ~amp.asString);
			~sidekick.sendMsg("/ttui/displayPaint");
		},
		2,{
		},
		3,{
		}
	)

},
"/ttui/pot",
recvPort:3000
);

OSCdef( \osc_button, {
    arg msg, time, addr, recvPort;
	switch(msg[1],
		0,{
		},
		1,{
		},
		2,{
		},
	)

},
"/ttui/button",
recvPort:3000
);
)

