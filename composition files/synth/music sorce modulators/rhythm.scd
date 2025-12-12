//array experiments

///tetrahedron
(
~az=[45.degrad,135.neg.degrad,45.neg.degrad,135.degrad];
~el=[35.264390.neg.degrad,35.264390.neg.degrad,35.264390.degrad,35.264390.degrad];
)

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



(var m,a,b,c, time=8; {

	//m=MouseX.kr(0,32400).round(1).asInteger;
	m=MouseX.kr(0,3).round(1).asInteger;
			a=Spherical(time,Select.kr(m,~az),Select.kr(m,~el)).z.round(time.reciprocal).poll;
			b=Spherical(time,Select.kr(m,~az),Select.kr(m,~el)).x.round(time.reciprocal).poll;
			c=Spherical(time,Select.kr(m,~az),Select.kr(m,~el)).y.round(time.reciprocal).poll;
			//(2.pow(a/12)/50).poll;
			//(2.pow(b/12)/50).poll;
			//(2.pow(c/12)/50).poll;
		}.play
		)

(
var time=2,az=pi/4, el=35.264390.degrad;

Spherical(time,pi/4,35.264390.degrad).y.round(time.reciprocal).postln;
Spherical(time,pi/4,35.264390.degrad).x.round(time.reciprocal).postln;
Spherical(time,pi/4,35.264390.degrad).z.round(time.reciprocal).postln;
)