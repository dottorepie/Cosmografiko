/*		~w= Buffer.alloc(s,2048);
		{
var signal,wt,m=0,amp,ph=0;

~level=32.collect{m=m+1;amp=m.reciprocal};
		signal=Signal.sineFill(1024,~level,[0]);

wt = signal.asWavetable;
~w.loadCollection(wt);
//signal.plot;
		}.value;

(

~w_function= Buffer.alloc(s,2048);
~function=Env([1.neg,1],[1],[0]).asSignal(1025);
~function=~function+(
	Signal.sineFill(1024,Array.fill(8, {20.rand}),[0])/4;
);
~function=~function.normalize;
//~function.plot;
~w_function.loadCollection(~function.asWavetableNoWrap);
//~w_function=Buffer.loadCollection(s,~function);

);*/

//λ=v/f speed of sound= 343m/s, 1234.8 km/h
//remember scale with float to get unwraped values
/// sun 0
/* (((343)/(57900000.0*1000.0))*100000000000.0).reciprocal.round(0.0000000000001)  //mercury 0.39, 90.degrad
 (((343)/(108200000.0*1000.0))*100000000000.0).reciprocal.round(0.0000000000001)  //venus 0.72, 180.degrad
 (((343)/(149600000.0*1000.0))*100000000000.0).reciprocal.round(0.0000000000001) //earth 1, 0.degrad
 (((343)/(227900000.0*1000.0))*100000000000.0).reciprocal.round(0.0000000000001) //mars 1.52, 60.degrad
 (((343)/(778600000.0)*1000.0)*100000000000.0).reciprocal.round(0.0000000000001) ///jupiter 5.2, 30.degrad
 (((343)/(1433500000.0*1000.0))*100000000000.0).reciprocal.round(0.0000000000001) //saturn 9.54, 20.degrad
 (((343)/(2872500000.0)*1000.0)*100000000000.0).reciprocal.round(0.0000000000001)  //uranus 19.2, 10.degrad
 (((343)/(4495100000.0*1000.0))*100000000000.0).reciprocal.round(0.0000000000001)  //neptune 30.06, 10.degrad*/

	(	~w= Buffer.alloc(s,2048);
		{
var signal,wt,m=0,amp,ph=0;

	signal=Signal.sineFill(1024,[0.39,0.72,1,1.52,5.2,9.54,19.2,30.06],
			[90.degrad,180.degrad,0.degrad,60.degrad,30.degrad,20.degrad,10.degrad,10.degrad]);  ///au units

wt = signal.asWavetable;
~w.loadCollection(wt);
signal.plot;
		}.value;
)
(
{Out.ar(0,Osc.ar(~w.bufnum,55,phase:0.degrad))}.play;
{Out.ar(1,Osc.ar(~w.bufnum,55,phase:90.degrad))}.play;
)

/////////////wavetable based on orbit periods

(	~w= Buffer.alloc(s,2048);
		{
var signal,wt,m=0,amp,ph=0;
var mercury=0.24.reciprocal,venus=0.62.reciprocal,earth=1.reciprocal;
var mars=1.8.reciprocal,jupiter=11.86.reciprocal;
var saturn=29.46.reciprocal,uranus=84.01.reciprocal,neptune=164.8.reciprocal;
var pluto=248.reciprocal;

	signal=Signal.sineFill(1024,[mercury,venus,earth,mars,jupiter,saturn,uranus,neptune,pluto],
			[0]);  ///au units

wt = signal.asWavetable;
~w.loadCollection(wt);
signal.plot;
		}.value;
)



//NOTE OSC FREQ STRUCTURE IS SOLAR SYSTEM WAVETABLE, WITH FUNDAMENTAL * COORDINATE MAGNITUDE * (SAW SEQUENCE*INTERVAL) * COORDINATE MUSICAL TEMPERAMENT FROM MELODY
///////////////////////////////////////////////////////////////////////POTENTENTIALLY * COORDINATE MUSICAL TEMPERAMENT FROM CHORD (OSC1,OSC2,OSC3)
/////////INTERVAL MAY BY THE CLASSICAL HARMONY WHOLE TONE INTERVAL OF (9/8)