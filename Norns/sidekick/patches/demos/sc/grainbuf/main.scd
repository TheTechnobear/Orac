~rPort=3000;
~synth = nil;
~audio_files = nil;
~audio_bufs = List.new;
~dict = Dictionary.new;

~density=10;
~gain=0.5;
~amp=0.5;
~rate=1.0;
~pos=0;
~sidekick = NetAddr("127.0.0.1", 3001); // sidekick

s.waitForBoot{
	"GrainBuf patch".postln;
	~sidekick.sendMsg("/nui/displayClear");
	~sidekick.sendMsg("/nui/textLine",15,0,0,"GrainBuf Patch");
	~sidekick.sendMsg("/nui/displayPaint");

	~path="/home/we/dust/audio/common/waves/*.wav";~audio_files= List.new;
	SoundFile.collect(~path).do { |f| ~audio_files.add(f.path);};
	~audio_files.do { | f| ~audio_bufs.add(Buffer.readChannel(s,f,channels:[0]))};

	SynthDef(\sdGrainBuf, {
		arg sndbuf, gate = 1,
		amp = 0.6, density = 10,
		dur=0.1, rate=1.0,
		pos=0, interp=2,
		pan=0, envbufnum = -1,
        gain=0.5,
		maxgrains=512;

		var sig,env, gen;
		env = EnvGen.kr(
				Env([0, 1, 0], [1, 1], \sin, 1),
				gate,
				levelScale: amp,
				doneAction: 2);

		gen = Impulse.kr(density);

		sig = GrainBuf.ar(
			2,
			gen,
			dur,
			sndbuf,
			rate,
			pos,
			interp,
			pan,
			envbufnum,
			maxgrains,
		);
        sig = sig * gain;
		Out.ar(0,sig);
	}
	).add;

	s.sync;
	2.wait;

    ~dict.add(\density -> ~density);
    ~dict.add(\gain -> ~gain);
    ~dict.add(\pos -> ~pos);
    ~dict.add(\rate -> ~rate);
    ~dict.add(\nbuf -> 0);
    ~dict.add(\sndbuf -> ~audio_bufs[0]);
	~dict.postln;
	~synth = Synth(\sdGrainBuf,~dict.asPairs);
};


(
OSCdef( \osc_encoder, {
    arg msg, time, addr, recvPort;
	switch(msg[1],
		0,{
			~density = ~density + (msg[2] * 10);
			~synth.set(\density, ~density);
			~sidekick.sendMsg("/nui/clearLine",0,1);
			~sidekick.sendMsg("/nui/textLine",15,1,0,"Density " ++ ~density.asString);
			~sidekick.sendMsg("/nui/displayPaint");
		},
		1,{
			~gain = ~gain + (msg[2] * 0.1);
			~synth.set(\gain, ~gain);
			~sidekick.sendMsg("/nui/clearLine",0,2);
			~sidekick.sendMsg("/nui/textLine",15,2,0,"Gain " ++ ~gain.asString);
			~sidekick.sendMsg("/nui/displayPaint");
		},
		2,{
			~pos = ~pos + (msg[2] * 0.1);
			~synth.set(\pos, ~pos);
			~sidekick.sendMsg("/nui/clearLine",0,3);
			~sidekick.sendMsg("/nui/textLine",15,3,0,"Position " ++ ~pos.asString);
			~sidekick.sendMsg("/nui/displayPaint");
		},
		3,{
			~rate = ~rate + (msg[2] * 0.1);
			~synth.set(\rate, ~rate);
			~sidekick.sendMsg("/nui/clearLine",0,4);
			~sidekick.sendMsg("/nui/textLine",15,4,0,"Rate " ++ ~rate.asString);
			~sidekick.sendMsg("/nui/displayPaint");
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
