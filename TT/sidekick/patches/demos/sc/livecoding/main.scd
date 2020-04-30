/*
Live Coding Template : Mark Harris (aka TheTechnobear)
This is an example of the what you might need for your supercollider patch on the Norns that you wish to interact with remotely (e.g. laptop/desktop)
It fulfils two roles,
- forwarding osc messages from Norns to your remote computer
- informs remote computer of audio files present on Norns

there are two use cases:
a) Live Coding
where you want to do everything remotely on your computer, either for performance or this is also useful for developing patches for the Norns
for this usage, you can use this patch 'as-is', and use the example at the base of this patch as a starting point for remote side.

b) Optimised remote live performance with dedicated patch.
The 'issue' with using this patch 'as-is' is that all CV messages are sent over the network, regardless of if you need them or not!
so an alternative option is...
develop your synth patch 'as normal' (to run on the Norns), then copy n' paste this patch into your patch
and remove any OSCdef for forwarding that you do not need to be forwarded to your remote client.
this approach will allow you to influence some parts of the patch on Norns.
(you can also extend the use of the client->Norns connection for other osc messages to control patch)
*/




/*
OSC messages

Live Coding support (see bottom of patch for examples)
send : /live/connect(host,port) - connect to Norns, and proxy Norns messages to host/port
/live/audiofile - file that exists on Norns (server), you cannot use SoundFile.collect as that is client side

*/

~sidekick = NetAddr("127.0.0.1", 3001); // sidekick


s.waitForBoot{
	"Live Coding patch".postln;
	s.sync;
	~sidekick.sendMsg("/ttui/displayClear",0);
	~sidekick.sendMsg("/ttui/textLine",0,15,0,0,"Live coding enabled");
	~sidekick.sendMsg("/ttui/displayPaint");
};



(
// osc /
~remote = nil;
~rPort=3000;

OSCdef( \liveConnect, {
	arg msg, time, addr, recvPort;
	'connect->'.post;msg[1].post; ' '.post;msg[2].postln;
	~remote = NetAddr(msg[1].asString, msg[2]); // remote server
	~sidekick.sendMsg("/ttui/displayClear",0);
	~sidekick.sendMsg("/ttui/textLine",0,15,0,0, "client connected");
	~sidekick.sendMsg("/ttui/textLine",0,5,1,0, msg[1].asString ++ ":" ++ msg[2].asString);
	~sidekick.sendMsg("/ttui/displayPaint");
}
,
'/live/connect',
recvPort:~rPort
);

OSCdef( \liveFiles, {
	arg msg, time, addr, recvPort;
	'files->'.post;msg[1].post; ' '.post;msg[2].postln;
	SoundFile.collect(msg[2].asString).do { |f| f.path.postln; };
    if (~remote != nil) {
	    SoundFile.collect(msg[2].asString).do { |f| ~remote.sendMsg(msg[1],f.path); };
    }
}
,
'/live/files',
recvPort:~rPort
);




//norns messages to forward to remote client
OSCdef( \osc_pot, { |msg, time, addr, recvPort|if(~remote != nil) { ~remote.sendMsg(msg[0],msg[1],msg[2]) }} ,
'/ttui/pot',recvPort:~rPort);
OSCdef( \osc_button, { |msg, time, addr, recvPort|if(~remote != nil) { ~remote.sendMsg(msg[0],msg[1],msg[2]) }} ,
'/ttui/button',recvPort:~rPort);
OSCdef( \osc_trig, { |msg, time, addr, recvPort|if(~remote != nil) { ~remote.sendMsg(msg[0],msg[1],msg[2]) }} ,
'/ttui/trig',recvPort:~rPort);

OSCdef( \osc_numpots, { |msg, time, addr, recvPort|if(~remote != nil) { ~remote.sendMsg(msg[0],msg[1]) }} ,
'/ttui/numpots',recvPort:~rPort);
OSCdef( \osc_numbuttons, { |msg, time, addr, recvPort|if(~remote != nil) { ~remote.sendMsg(msg[0],msg[1]) }} ,
'/ttui/numbuttons',recvPort:~rPort);
OSCdef( \numgateout, { |msg, time, addr, recvPort|if(~remote != nil) { ~remote.sendMsg(msg[0],msg[1]) }} ,
'/ttui/numgateout',recvPort:~rPort);

)

//================================== EXAMPLE REMOTE CLIENT ==============================================
//================================== EXAMPLE REMOTE CLIENT ==============================================

// EXAMPLE PATCH USED ON REMOTE CLIENT
// you'll need/want something like this live-coding is running on remote

/*



// connect to remote
~remoteip= 'tt.local';
s.options.maxLogins = 4;
Server.default = s = Server.remote("Remote", NetAddr(~remoteip.asString,57110),s.options,1);
s.initTree;
s.startAliveThread;

~localip = '192.168.1.18';
~rPort=3000;

~sidekick = NetAddr(~remoteip.asString, 3001); // sidekick


// on connection we will get a list of audio files on the remote
~audio_files = List.new;
OSCdef(\liveaudiofile,
	{
		arg msg, time, addr, recvPort;
		msg[1].postln;
		~audio_files.add(msg[1]);
	},
	'/live/audiofile',
	recvPort:~rPort
);

//connect to live patch, and ask for redirection
m = NetAddr(~remoteip.asString, ~rPort);
m.sendMsg("/live/connect",~localip,~rPort);
m.sendMsg("/live/files","/live/audiofile", "/home/we/dust/audio/common/waves/*.wav");
~audio_files.postln;

~sidekick.sendMsg("/sk/deviceInfo");

// note from here on, the patch would be the same as run on the remote

// we only want to update display periodically
// constant updates are expensive
{
	loop{
		~sidekick.sendMsg("/ttui/displayPaint");
        0.1.wait;
	}
}.fork;

// lets see register some messages to test
// (you can pickup all the inbound messages from 0-default template)

OSCdef( \osc_pot, {
	arg msg, time, addr, recvPort;
    if ( ~lastV[msg[1]] != msg[2] ,
	'remote->'.post;msg[0].post;msg[1].post;':'.post;msg[2].postln;
	~sidekick.sendMsg("/ttui/textLine",0,15,2,0,"test");
    );
    ~lastV[msg[1]] = msg[2];
},
'/ttui/pot',recvPort:~rPort);

OSCdef( \osc_button, {
	arg msg, time, addr, recvPort;
    'remote->'.post;msg[0].post;msg[1].postln;
	if(msg[1]==0 && msg[2]==1) {
		~sidekick.sendMsg("/ttui/displayClear",0);
	}
},
'/ttui/button',recvPort:~rPort);

OSCdef( \osc_trig, {
	arg msg, time, addr, recvPort;
	msg.postln;
},
'/ttui/trig',recvPort:~rPort);

OSCdef( \osc_numpots, {
	arg msg, time, addr, recvPort;
    'remote->'.post;msg.postln;
},
'/ttui/numpots',
recvPort:~rPort
);

OSCdef( \osc_numbuttons, {
	arg msg, time, addr, recvPort;
    'remote->'.post;msg.postln;
},
'/ttui/numbuttons',
recvPort:~rPort
);

OSCdef( \osc_numgateout, {
	arg msg, time, addr, recvPort;
    'remote->'.post;msg.postln;
},
'/ttui/numgateout',
recvPort:~rPort
);


// what audio files are there?
// ~audio_files.do { |f| f.postln;};

// note:
// SoundFile.collect won't work, see this is run client side...
// Buffer.read, expects a server file ... so something like Buffer.read(~audio_files[0]);


*/

