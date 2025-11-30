/////////////array
(
{
	var az=0,el1=0,sph,n=90,iter=45,rep=360,el,silver=(1+2.sqrt),w=((1+5.sqrt)/2);
	~az=[];~el=[];

rep.do{
el=iter.collect{
		el1 = 90/n;
			n=n-2;
sph=Spherical(1,az.degrad,el1.degrad).phi.round(0.000000000001);
	};
~az=~az++az.degrad;~el=~el++el;
//az = (az+1).wrap(0,360);
		az=(az+(360-(360/w))).wrap(0,360);
el1=0;n=90;
	};
}.value;
)



////plotters
(

var data,data1,data2,data3,data4,data5,run = true;
var az=0,el=0,pl=0,pl1=0,plb=0,plc=0,pld=0,ple=0,plf=0;
var el1=0,el2=0,el3=0,el4=0,el5=0,sph2a,sph3a,sph4a,sph5a;
var iter=10,rep=90,mag=1000,step=pi.reciprocal;
var sph,sphcart,sphcart1,sph1,sphcart2,sph2,sphcart3,sphcart4,sphcart5,sph3,sph4,sph5;
var y=1,x=1,y1=1,x1=1,y2=1,x2=1,y3=1,x3=1,y4=1,x4=1,y5=1,x5=1;
var silver=(1+2.sqrt),w=((1+5.sqrt)/2);
var ot=0.degrad;
var angle=45.degrad,rotor1,rotor2,rotor3,rotor4,rotation1,rotation2,rotation3,rotation4;
var q1,q2,q3,q4,sph2q,sph3q,sph4q,sph5q;
var xyz1=[1,0,0].normalizeSum.sqrt,xyz2=[0,1,0].normalizeSum.sqrt,axis1,axis2;
var i=Quaternion(0, xyz1.[0], 0, 0),j=Quaternion(0, 0, xyz1.[1], 0),k=Quaternion(0, 0, 0, xyz1.[2]);
var i1=Quaternion(0, xyz2.[0], 0, 0),j1=Quaternion(0, 0, xyz2.[1], 0),k1=Quaternion(0, 0, 0, xyz2.[2]);


	axis1=i+j+k;
	axis2=i1+j1+k1;

~data=[];

 iter.do{
data=rep.collect{
	el=~el.[pl];
	y=1/x;
	x=x+step;
		//y.postln;
	pl=pl+1;

		sph=Spherical(mag,az,el);
		sphcart=Cartesian(sph.x*y,sph.y*y,sph.z).asArray;
};
	data1=rep.collect{
	el1=~el.[plb];
	y1=1/x1;
	x1=x1+step;
	plb=plb+1;

		sph1=Spherical(mag,az,el1.neg);
		sphcart1=Cartesian(sph1.x*y1,sph1.y*y1,sph1.z).asArray;
};

data2=rep.collect{
	el2=~el.[plc];
	y2=1/x2;
	x2=x2+step;
	plc=plc+1;

sph2=Spherical(mag,az,el2);
		sph2a=Cartesian(sph2.x*y3,sph2.y*y3,sph2.z);

q1=Quaternion(0,sph2a.x.round(0.00001),sph2a.y.round(0.00001),sph2a.z.round(0.00001));
rotor1=((axis1*exp(Complex(0,1)*angle).imag)+exp(Complex(0,1)*angle).real);
rotation1=rotor1*q1*rotor1.conjugate;

sph2q= Cartesian(rotation1.b,rotation1.c,rotation1.d);
sphcart2=Cartesian(sph2q.x,sph2q.y,sph2q.z).asArray;
};

data3=rep.collect{
	el3=~el.[pld];
	y3=1/x3;
	x3=x3+step;
	pld=pld+1;

sph3=Spherical(mag,az,el3.neg);
sph3a=Cartesian(sph3.x*y3,sph3.y*y3,sph3.z);

q2=Quaternion(0,sph3a.x.round(0.00001),sph3a.y.round(0.00001),sph3a.z.round(0.00001));
rotor2=((axis1*exp(Complex(0,1)*angle).imag)+exp(Complex(0,1)*angle).real);
rotation2=rotor2*q2*rotor2.conjugate;

sph3q= Cartesian(rotation2.b,rotation2.c,rotation2.d);
sphcart3=Cartesian(sph3q.x,sph3q.y,sph3q.z).asArray;
};

data4=rep.collect{
	el4=~el.[ple];
	y4=1/x4;
	x4=x4+step;
	ple=ple+1;

sph4=Spherical(mag,az,el4);
		sph4a=Cartesian(sph4.x*y4,sph2.y*y4,sph4.z);

q3=Quaternion(0,sph4a.x.round(0.00001),sph4a.y.round(0.00001),sph4a.z.round(0.00001));
rotor3=((axis2*exp(Complex(0,1)*angle).imag)+exp(Complex(0,1)*angle).real);
rotation3=rotor3*q3*rotor3.conjugate;

sph4q= Cartesian(rotation3.b,rotation3.c,rotation3.d);
sphcart4=Cartesian(sph4q.x,sph4q.y,sph4q.z).asArray;
};

data5=rep.collect{
	el5=~el.[plf];
	y5=1/x5;
	x5=x5+step;
	plf=plf+1;

sph5=Spherical(mag,az,el5.neg);
		sph5a=Cartesian(sph5.x*y5,sph5.y*y5,sph5.z);

q4=Quaternion(0,sph5a.x.round(0.00001),sph5a.y.round(0.00001),sph5a.z.round(0.00001));
rotor4=((axis2*exp(Complex(0,1)*angle).imag)+exp(Complex(0,1)*angle).real);
rotation4=rotor4*q4*rotor4.conjugate;

sph5q= Cartesian(rotation4.b,rotation4.c,rotation4.d);
sphcart5=Cartesian(sph5q.x,sph5q.y,sph5q.z).asArray;
};
	az=~az.[pl1];
	pl1=pl1+1;
	y=1;x=1;b=0;pl=0;
	plb=0;y1=1;x1=1;
	plc=0;y2=1;x2=1;
	pld=0;y3=1;x3=1;
	ple=0;y4=1;x4=1;
	plf=0;y5=1;x5=1;
	~data=~data++data++data1++data2++data3++data4++data5;
};


w = Window.new("3D Scatterplot", Rect(40,40, 1000, 800)).front;
a = ScatterView3d(w, Rect(0,0, 800,800), ~data, [-1000, 1000].asSpec,[-1000, 1000].asSpec,[-1000, 1000].asSpec);
a.drawMethod = \fillRect;
a.symbolSize = 1;
a.symbolColor = Color.white;
a.background = Color.black;

// Y Slider
Slider(w, Rect(820, 10, 10, 450)).action_{|me|
    a.rotY = me.value * 2pi;
    w.refresh;
};
// X Slider
Slider(w, Rect(870, 10, 10, 450)).action_{|me|
    a.rotX = me.value * 2pi;
    w.refresh;
};
// Z Slider
Slider(w, Rect(920, 10, 10, 450)).action_{|me|
    a.rotZ = me.value * 2pi;
    w.refresh;
};

)
(
var data,data1,data2,data3,data4,data5,run = true;
var az=0,el=0,pl=0,pl1=0,plb=0,plc=0,pld=0,ple=0,plf=0;
var el1=0,el2=0,el3=0,el4=0,el5=0,sph2a,sph3a,sph4a,sph5a;
var iter=45,rep=90,mag=1000,step=1+2.sqrt;
var sph,sphcart,sphcart1,sph1,sphcart2,sph2,sphcart3,sphcart4,sphcart5,sph3,sph4,sph5;
var y=1,x=1,y1=1,x1=1,y2=1,x2=1,y3=1,x3=1,y4=1,x4=1,y5=1,x5=1;
var silver=(1+2.sqrt),w=((1+5.sqrt)/2);
var ot=0.degrad;
var angle=45.degrad,rotor1,rotor2,rotor3,rotor4,rotation1,rotation2,rotation3,rotation4;
var q1,q2,q3,q4,sph2q,sph3q,sph4q,sph5q;
var xyz1=[1,0,0].normalizeSum.sqrt,xyz2=[0,1,0].normalizeSum.sqrt,axis1,axis2;
var i=Quaternion(0, xyz1.[0], 0, 0),j=Quaternion(0, 0, xyz1.[1], 0),k=Quaternion(0, 0, 0, xyz1.[2]);
var i1=Quaternion(0, xyz2.[0], 0, 0),j1=Quaternion(0, 0, xyz2.[1], 0),k1=Quaternion(0, 0, 0, xyz2.[2]);


	axis1=i+j+k;
	axis2=i1+j1+k1;

~data=[];

 iter.do{
data=rep.collect{
	el=~el.[pl];
	y=1/x;
	x=x+step;
		//y.postln;
	pl=pl+1;

		sph=Spherical(mag,az,el);
		sphcart=Cartesian(sph.x*y,sph.y*y,sph.z).asArray;
};
	data1=rep.collect{
	el1=~el.[plb];
	y1=1/x1;
	x1=x1+step;
	plb=plb+1;

		sph1=Spherical(mag,az,el1.neg);
		sphcart1=Cartesian(sph1.x*y1,sph1.y*y1,sph1.z).asArray;
};

data2=rep.collect{
	el2=~el.[plc];
	y2=1/x2;
	x2=x2+step;
	plc=plc+1;

sph2=Spherical(mag,az,el2);
		sph2a=Cartesian(sph2.x*y2,sph2.y*y2,sph2.z);

q1=Quaternion(0,sph2a.x.round(0.00001),sph2a.y.round(0.00001),sph2a.z.round(0.00001));
rotor1=((axis1*exp(Complex(0,1)*angle).imag)+exp(Complex(0,1)*angle).real);
rotation1=rotor1*q1*rotor1.conjugate;

sph2q= Cartesian(rotation1.b,rotation1.c,rotation1.d);
sphcart2=Cartesian(sph2q.x,sph2q.y,sph2q.z).asArray;
};

data3=rep.collect{
	el3=~el.[pld];
	y3=1/x3;
	x3=x3+step;
	pld=pld+1;

sph3=Spherical(mag,az,el3.neg);
sph3a=Cartesian(sph3.x*y3,sph3.y*y3,sph3.z);

q2=Quaternion(0,sph3a.x.round(0.00001),sph3a.y.round(0.00001),sph3a.z.round(0.00001));
rotor2=((axis1*exp(Complex(0,1)*angle).imag)+exp(Complex(0,1)*angle).real);
rotation2=rotor2*q2*rotor2.conjugate;

sph3q= Cartesian(rotation2.b,rotation2.c,rotation2.d);
sphcart3=Cartesian(sph3q.x,sph3q.y,sph3q.z).asArray;
};

data4=rep.collect{
	el4=~el.[ple];
	y4=1/x4;
	x4=x4+step;
	ple=ple+1;

sph4=Spherical(mag,az,el4);
		sph4a=Cartesian(sph4.x*y4,sph2.y*y4,sph4.z);


q3=Quaternion(0,sph4a.x.round(0.00001),sph4a.y.round(0.00001),sph4a.z.round(0.00001));
rotor3=((axis2*exp(Complex(0,1)*angle).imag)+exp(Complex(0,1)*angle).real);
rotation3=rotor3*q3*rotor3.conjugate;

sph4q= Cartesian(rotation3.b,rotation3.c,rotation3.d);
sphcart4=Cartesian(sph4q.x,sph4q.y,sph4q.z).asArray;
};

data5=rep.collect{
	el5=~el.[plf];
	y5=1/x5;
	x5=x5+step;
	plf=plf+1;

sph5=Spherical(mag,az,el5.neg);
		sph5a=Cartesian(sph5.x*y5,sph5.y*y5,sph5.z);

q4=Quaternion(0,sph5a.x.round(0.00001),sph5a.y.round(0.00001),sph5a.z.round(0.00001));
rotor4=((axis2*exp(Complex(0,1)*angle).imag)+exp(Complex(0,1)*angle).real);
rotation4=rotor4*q4*rotor4.conjugate;

sph5q= Cartesian(rotation4.b,rotation4.c,rotation4.d);
sphcart5=Cartesian(sph5q.x,sph5q.y,sph5q.z).asArray;
};
	az=~az.[pl1];
	pl1=pl1+1;
	y=1;x=1;b=0;pl=0;
	plb=0;y1=1;x1=1;
	plc=0;y2=1;x2=1;
	pld=0;y3=1;x3=1;
	ple=0;y4=1;x4=1;
	plf=0;y5=1;x5=1;

	angle=angle.rand.wrap((45/3).degrad,45.degrad);

	~data=~data++data++data1++data2++data3++data4++data5;


};


w = Window.new("3D Scatterplot", Rect(40,40, 800, 800)).front;

~v = UserView.new(w,Rect(0,0,800,800)).background_(Color.black);
b = ScatterView3d(~v, Rect(0,0, 800,800), ~data, [-1000, 1000].asSpec,[-1000, 1000].asSpec,[-1000, 1000].asSpec);
b.drawMethod = \fillRect;
b.symbolSize = 0.5;
b.symbolColor = Color.white;
b.background = Color.black;

~v.animate;
~v.drawFunc ={
Pen.translate(400,400);

		b.rot(ot,ot,ot);
    ~v.refresh;
		ot=ot+6.degrad;

};

{ while { run } {~v.background_(Color.black); ~v.refresh; (1/14).wait } }.fork(AppClock);
)




