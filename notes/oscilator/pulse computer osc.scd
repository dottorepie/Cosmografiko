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









(
var freq= 110;
{LPF.ar(Pulse.ar(freq*32,width:0.5).abs*SinOsc.ar(freq,mul:1),freq*16)*0.5}.play;
)


