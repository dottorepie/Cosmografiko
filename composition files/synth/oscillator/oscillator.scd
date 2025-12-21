
~control_seed=18.rand

(
//var silver_ratio=(1+2.sqrt),gold_ratio=((1+5.sqrt)/2), copper_ratio=pi;
var fibonacci=[1,2,3,5,8,13,21,34,55,89,144,233,377,610,987,1597,2584,4181];
var pell=[0,1,2,5,12,29,70,169,408,985,2378,5741,13860,33461,80782,195025,470832,1136689];
//var polygon=[6,12,24,48,96,192,384,768,1536,3072,6144,12288,24576,49152,98304,196608,393216,786432];
//var polygon_octave=polygon.[~control_seed]/6, aprox,archimidis=polygon.[~control_seed];
var number=496/2,polygon=20.collect{number=number*2};
var interval_s,interval_g,interval_c,seed;

//aprox= ((sin((30/polygon_octave).degrad)*2)*polygon)/2;  //((sin((30/4).degrad)*2)*24)/2

///!!!
///((sin((((360/8128)/2)/128).degrad)*2)*(8128*128))/2  ///pi aproximation (archimedean) via perfect numbers "polygons" 6,28,496,8128

interval_g=fibonacci.[~control_seed];
interval_s=pell.[~control_seed];
interval_c=polygon.[~control_seed];

seed=interval_c.postln;
thisThread.randSeed = seed;

// create a function that returns a Routine

r = { Routine({
    loop({#[0,1,2,3].choose.yield })
}) };
Array.fill(4, r.value);
)

((sin((((360/8128)/2)/128).degrad)*2)*(8128*128))/2

///algorithmic sequence creation

///fibonacci

///pell numbers

////archimedes

/*
(	~w= Buffer.alloc(s,2048);
		{
var signal,wt,m=0,amp,ph=0;
var mercury=0.24,venus=0.62,earth=1;
var mars=1.8,jupiter=11.86;
var saturn=29.46,uranus=84.01,neptune=164.8;
var pluto=248;
var sun= (256.0*1000000.0); ///revolution around galaxy

	signal=Signal.sineFill(1024,[mercury,venus,earth,mars,jupiter,saturn,uranus,neptune,pluto],
			[0]);  ///au units

wt = signal.asWavetable;
~w.loadCollection(wt);
signal.plot;
		}.value;
)

*/
(
Buffer.freeAll;
~n=1/2;~array=32.collect{~n=~n*2};
~w_function= Buffer.alloc(s,2048);
~function=Env([1.neg,1],[1],[0]).asSignal(1025);
~function=~function+(
	Signal.sineFill(1024,~array,[0])/16;
);
~function=~function.normalize;
~function.plot;
~w_function.loadCollection(~function.asWavetableNoWrap);
//~w_function=Buffer.loadCollection(s,~function);

)

(
var freq=56, b=55,amp=1;
//{(Shaper.ar(~w_function.bufnum,(LPF.ar(Saw.ar(freq).abs,freq/16))+SinOsc.ar(freq-b,0.degrad),mul:MouseX.kr(0.0001,1)))}.play
{Out.ar(0,Shaper.ar(~w_function.bufnum,SinOsc.ar(freq,mul:SinOsc.ar(MouseX.kr(0.001,100),0.degrad,0.89),phase:0.degrad)))}.play;
{Out.ar(1,Shaper.ar(~w_function.bufnum,SinOsc.ar(freq,mul:SinOsc.ar(MouseX.kr(0.001,100),0.degrad,0.89),phase:90.degrad)))}.play;
)



/////////////////

/*(	~w= Buffer.alloc(s,2048);////////modulator

~n=1/2;~array=28.collect{~n=~n*2};
		{
	var signal,wt,ph,n=1.neg;
	//Signal.sineFill(1024,[6,12,28,496,8128]
	signal=Signal.sineFill(1024,~array;);

wt = signal.asWavetable;
~w.loadCollection(wt);
signal.plot;
		}.value;
)*/

/*(	~w1= Buffer.alloc(s,2048);////////////sine carrier
		{
var signal,wt,n=496/2;
	//Signal.sineFill(1024,[6,12,28,496,8128]
	signal=Signal.sineFill(1024,[6,28,496,8128]);

wt = signal.asWavetable;
~w1.loadCollection(wt);
signal.plot;
		}.value;
)*/


/*(
var freq=56, b=1,amp=1/4;
{Out.ar(0,(Osc.ar(~w.bufnum,freq,phase:0.degrad)+Osc.ar(~w1.bufnum,freq,phase:0.degrad))*amp)}.play;
{Out.ar(1,(Osc.ar(~w.bufnum,freq,phase:90.degrad)+Osc.ar(~w1.bufnum,freq,phase:90.degrad))*amp)}.play;
)*/


/*(
var freq=56, b=1,amp=1/2;
{Out.ar(0,(Osc.ar(~w.bufnum,freq,phase:0.degrad))*amp)}.play;
{Out.ar(1,(Osc.ar(~w.bufnum,freq,phase:90.degrad))*amp)}.play;
)*/






