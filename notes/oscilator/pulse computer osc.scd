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



///other waveforms with analog wavetable similars
///with saw abs, with Triangle no abs, as it is similar to sine

///Shaper
{Out.ar(0,(Saw.ar(56*2*4).abs+SinOsc.ar(56))*0.1)}.play

{Out.ar(0,(Saw.ar(220).abs+SinOsc.ar(220+50))*0.1)}.play

{Out.ar(0,(LFTri.ar(220)+SinOsc.ar(220-50))*0.1)}.play

{Out.ar(0,(LFTri.ar(56*5)+SinOsc.ar(56*4))*0.1)}.play


////VOSC
({Out.ar(0,(LFTri.ar(3*64).abs))*0.1}.play;
{Out.ar(0,SinOsc.ar(2*64)*0.1)}.play)

({Out.ar(0,Saw.ar(3*64)*0.1)}.play;
{Out.ar(0,SinOsc.ar(2*64)*0.1)}.play)

({Out.ar(0,Saw.ar(220)*0.1)}.play;
{Out.ar(0,SinOsc.ar(220-50)*0.1)}.play)



//////wavetables
s.boot;

////shaper
(
			~w_function= Buffer.alloc(s,2048);
		{
var signal,wt,m=0,amp,ph=0;

~level1=32.collect{m=m+1;amp=m.reciprocal};
		signal=Signal.sineFill(1024,~level1,[0]);

wt = signal.asWavetable;
~w_function.loadCollection(wt);
signal.plot;
		}.value;
);

(
~function=Env([1.neg,1],[1],[0]).asSignal(1025);
~function=~function+(
	Signal.sineFill(1025,(0!3)++[0,0,0,1,1,1].scramble,{rrand(0,2pi)}!9)/4;
);
~function=~function.normalize;
~function.plot;
~w_function.loadCollection(~function.asWavetableNoWrap);
)


(
var freq=220,b_x=50;
//{(LPF.ar(Shaper.ar(~w_function.bufnum,SinOsc.ar(freq-(b_x),0.degrad,0.1),mul:0.1),440)*SinOsc.ar(220-b_x),0.degrad,0.1)}.play;
{LPF.ar(Shaper.ar(~w_function.bufnum,SinOsc.ar(freq-(b_x),0.degrad,0.1),mul:0.1),440)}.play;
)


///vosc

	~w_shape1= Buffer.alloc(s,2048);
		{
var signal,wt,m=0,amp,ph=0;

~level1=32.collect{m=m+1;amp=m.reciprocal};
		signal=Signal.sineFill(1024,~level1,[0]);

wt = signal.asWavetable;
~w_shape1.loadCollection(wt);
signal.plot;
		}.value;

						~w_shape2= Buffer.alloc(s,2048);
		{
var signal,wt,m=0,amp,ph=0;

~level2=32.collect{m=m+1;amp=m.reciprocal};
		signal=Signal.sineFill(1024,~level2,[0]);

wt = signal.asWavetable;
~w_shape2.loadCollection(wt);
signal.plot;
		}.value;

						~w_shape3= Buffer.alloc(s,2048);
		{
var signal,wt,m=0,amp,ph=0;

~level3=32.collect{m=m+1;amp=m.reciprocal};
		signal=Signal.sineFill(1024,~level3,[0]);

wt = signal.asWavetable;
~w_shape4.loadCollection(wt);
signal.plot;
		}.value;

						~w_shape4= Buffer.alloc(s,2048);
		{
var signal,wt,m=0,amp,ph=0;

~level4=32.collect{m=m+1;amp=m.reciprocal};
		signal=Signal.sineFill(1024,~level4,[0]);

wt = signal.asWavetable;
~w_shape4.loadCollection(wt);
signal.plot;
		}.value;

(
var freq=220,b_x=50.bufpos;
//{(LPF.ar(VOsc.ar(bufpos:,(freq),mul:1).abs,440)*SinOsc.ar(freq-(b_x),0.degrad,1))}.play
//{(LPF.ar(VOsc.ar(bufpos:SinOsc.ar(freq-(b_x),0.degrad,1).range(0,1),(freq),mul:1).abs,440))}.play;
{(LPF.ar(VOsc.ar(bufpos:MouseX.kr(0,1),(freq),mul:1).abs,440)*SinOsc.ar(freq-(b_x),0.degrad,1))}.play;
)