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





// sig1=BPF.ar(BRF.ar(
(LPF.ar(Pulse.ar((freq)+b_x,width:0.5,mul:amp).abs,low/16)*SinOsc.ar((freq/pulsenum)+b_x,phase,amp)),
	band_osc3.lag(0.1),2.sqrt.reciprocal),band_osc1.lag(0.1),2.sqrt.reciprocal);



(
var freq= 110;
{LPF.ar(Pulse.ar(freq*32,width:0.5).abs*SinOsc.ar(freq,mul:1),freq*16)*0.5}.play;
)



///other waveforms
///with saw abs, with Triangle no abs, as it is similar to sine

{Out.ar(0,(Saw.ar(56*2*4).abs+SinOsc.ar(56))*0.1)}.play

{Out.ar(0,(LFTri.ar(56*5)+SinOsc.ar(56*4))*0.1)}.play

({Out.ar(0,LFTri.ar(3*64))}.play;
{Out.ar(0,SinOsc.ar(2*64))}.play)

({Out.ar(0,Saw.ar(3*64).abs)}.play;
{Out.ar(0,SinOsc.ar(2*64))}.play)



//////wavetables
s.boot;

// Assume wavetable bank loaded into buf
(
SynthDef(\compareOscs, {
    var freq = 110;
    var idx  = SinOsc.kr(0.2).range(0, 7); // Move across wavetables
    var a = VOsc.ar(\buf.ir(0),  freq, idx);
    var b = VOsc3.ar(\buf.ir(0), freq, idx);

    Out.ar(0, [a, b] * 0.2); // left = VOsc, right = VOsc3
}).add;
)

Synth.new(\compareOscs)