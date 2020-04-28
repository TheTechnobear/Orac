~sidekick = NetAddr("127.0.0.1", 3001); // sidekick

~pitch = 440;
~amp = 0.5;

~dict = Dictionary.new;
~dict.add(\pitch -> ~pitch);
~dict.add(\amp -> ~amp);


s.waitForBoot{
	"Simple Synth".postln;
	~sidekick.sendMsg("/nui/displayClear");
	~sidekick.sendMsg("/nui/textLine",15,0,0,"Simple Patch");
	~sidekick.sendMsg("/nui/displayPaint");



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
OSCdef( \osc_encoder, {
    arg msg, time, addr, recvPort;
	switch(msg[1],
		0,{
			~pitch = ~pitch + (msg[2] * 100);
			~synth.set(\freq, ~pitch);
			~sidekick.sendMsg("/nui/clearLine",0,1);
			~sidekick.sendMsg("/nui/textLine",15,1,0,"Freq " ++ ~pitch.asString);
			~sidekick.sendMsg("/nui/displayPaint");
		},
		1,{
			~amp = ~amp + (msg[2] * 0.1);
			~synth.set(\amp, ~amp);
			~sidekick.sendMsg("/nui/clearLine",0,2);
			~sidekick.sendMsg("/nui/textLine",15,2,0,"Amp " ++ ~amp.asString);
			~sidekick.sendMsg("/nui/displayPaint");
		},
		2,{
		},
		3,{
		}
	)

},
"/nui/encoder",
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
"/nui/button",
recvPort:3000
);
)

