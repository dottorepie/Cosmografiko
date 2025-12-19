		~w= Buffer.alloc(s,2048);
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

);

(
{Out.ar(0,Osc.ar(~w_function.bufnum,220,phase:0.degrad))}.play;
{Out.ar(1,Osc.ar(~w_function.bufnum,220,phase:90.degrad))}.play;
)