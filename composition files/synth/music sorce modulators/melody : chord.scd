//array experiments

////silver star
(
{
	var az=0,el1=0,sph,n=90,iter=90,rep=360,el,silver=(1+2.sqrt),w=((1+5.sqrt)/2);
	~az=[];~el=[];

rep.do{
el=iter.collect{
		el1 = 90/n;
			n=n-1;
sph=Spherical(1,az.degrad,el1.degrad).phi.round(0.000000000001);
	};
~az=~az++az.degrad;~el=~el++el;
//az = (az+1).wrap(0,360);
		az=(az+(360-(360/silver))).wrap(0,360);
el1=0;n=90;
	};
}.value;
);

/////sphere
		(
{
var  sph1,sph2,sph3,az1=0,el1=0,az2=0,el2=0,gold_r=((1+5.sqrt)/2),silver_r=(1+2.sqrt);
var azimuth,elevation,angle=0,n=12,ellipsis=[1,1,1];
var mag1=1,mag2=1,mag3=1,mag4=1,mag5=1,mag6=1,mag7=1;
	~az=[];~el=[];

	360.do{
azimuth=90.collect{
			az1 = (az1+((180*2.pow(n/12))-((180*2.pow(n/12))/silver_r))).wrap((90*2.pow(n/12)).neg,(90*2.pow(n/12)));
		   el1 = (el1+((90*2.pow(n/12))-((90*2.pow(n/12))/silver_r))).wrap((45*2.pow(n/12)).neg,(45*2.pow(n/12)));
sph1=(Spherical(mag1,(az1.degrad+angle.degrad).wrap(pi.neg,pi),(el1.degrad+angle.degrad).wrap((pi/2).neg,(pi/2)))).theta.round(0.000000000001);
	};

elevation=90.collect{
				az2 = (az2+((180*2.pow(n/12))-((180*2.pow(n/12))/silver_r))).wrap((90*2.pow(n/12)).neg,(90*2.pow(n/12)));
			el2 = (el2+((90*2.pow(n/12))-((90*2.pow(n/12))/silver_r))).wrap((45*2.pow(n/12)).neg,(45*2.pow(n/12)));
sph2=(Spherical(mag2,(az2.degrad+angle.degrad).wrap(pi.neg,pi),(el2.degrad+angle.degrad).wrap((pi/2).neg,(pi/2)))).phi.round(0.000000000001);
	};


angle=(angle+((180*2.pow(n/12))-((180*2.pow(n/12))/1.6180339887499))).wrap(0,(180*2.pow(n/12)));
~az=~az++azimuth;~el=~el++elevation;
		az1=0;el1=0;az2=0;el2=0;
	}
}.value;
);


///tetrahedron
(
~az=[45.degrad,135.neg.degrad,45.neg.degrad,135.degrad];
~el=[35.264390.neg.degrad,35.264390.neg.degrad,35.264390.degrad,35.264390.degrad];
)
//////test array
(
~az=[90.degrad,0.degrad];
~el=[0.degrad,0.degrad];
)

////tester
(var m,b,c,d,interval=56,octave=2; {

	//m=MouseX.kr(0,3).round(1).asInteger;
		//m=MouseX.kr(0,1).round(1).asInteger;
	m=MouseX.kr(0,(360*90)).round(1).asInteger;
	b=Spherical(interval*octave,Select.kr(m,~az),Select.kr(m,~el)).x.round(1);
	c=Spherical(interval*octave,Select.kr(m,~az),Select.kr(m,~el)).y.round(1);
	d=Spherical(interval*octave,Select.kr(m,~az),Select.kr(m,~el)).z.round(1);
	(2.pow(b/interval)).round(0.0001).poll;
	(2.pow(c/interval)).round(0.0001).poll;
	(2.pow(d/interval)).round(0.0001).poll;
		}.play
		)


(
SynthDef(\chord, {
    var freq1,freq2,freq3,amp1,amp2,amp3,n1,n2,n3,interval=12,fund=220,env;

	env= EnvGen.kr(Env.perc(0.1, 10),doneAction:2,levelScale:1/10);

	freq1=fund*2.pow(n1/interval);
	freq2=fund*2.pow(n2/interval);
	freq3=fund*2.pow(n3/interval);

	osc1=SinOsc.ar(freq1,mul:amp1);
	osc1=SinOsc.ar(freq2,mul:amp2);
	osc1=SinOsc.ar(freq2,mul:amp3);

		Out.ar(2, Pan2.ar(osc1*env,0));
		Out.ar(2, Pan2.ar(osc2*env,0));
	    Out.ar(2, Pan2.ar(osc3*env,0));


	};
}).add;
)

	(
		~chord=Pdef(\1, Pbind(\instrument, \chord,
			//\dur,Pseq(~dur1,inf);
		\dur,4;
		))
)





TempoClock.default.tempo_(1/1);


~chord.play;
~chord.pause;
)