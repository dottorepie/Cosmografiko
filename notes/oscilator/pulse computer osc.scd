///////////////////////////////////////////////////
//////////////////////////////////////////////experiments

{Pulse.ar(100,width:0.5,mul:SinOsc.ar(10))}.play;

(
var freq=110;
{Pulse.ar(freq,width:freq)*SinOsc.ar(freq).abs}.play;
)

(
var freq= 100;
{Pulse.ar(1000,width:0.1).abs*SinOsc.ar(100,mul:1)}.play;
)
///////////////////////////////////////////////////
//////////////////////////////////////////////





sig1=BPF.ar(BRF.ar(
(LPF.ar(Pulse.ar((freq)+b_x,width:0.5,mul:amp).abs,low/16)*SinOsc.ar((freq/pulsenum)+b_x,phase,amp)),
	band_osc3.lag(0.1),2.sqrt.reciprocal),band_osc1.lag(0.1),2.sqrt.reciprocal);



(
var freq= 110;
{LPF.ar(Pulse.ar(freq*32,width:0.5).abs*SinOsc.ar(freq,mul:1),freq*16)*0.5}.play;
)



///other waveforms

{Out.ar(0,Saw.ar(3*64).abs+SinOsc.ar(2*64))}.play

({Out.ar(0,LFTri.ar(3*64))}.play;
{Out.ar(0,SinOsc.ar(2*64))}.play)

