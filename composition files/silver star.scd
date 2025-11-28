
(

var data,data1,data2,data3,data4,data5,run = true;
var az=0,el=0,el1=0,pl=0,pl1=0,plb=0;
var iter=45,rep=45,mag=1000,step=2.sqrt.reciprocal;
var sph,sphcart,sphcart1,sph1;
var y=1,x=1,y1=1,x1=1,y2=1,x2=1,y3=1,x3=1;
var y4=1,x4=1,y5=1,x5=1;
var ot=0.degrad,silver=(1+2.sqrt),w=((1+5.sqrt)/2);

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

	az=~az.[pl1];
	pl1=pl1+1;
	y=1;x=1;b=0;pl=0;
	plb=0;y1=1;x1=1;
	~data=~data++data++data1;
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
var az=0,el=0,el1=0,pl=0,pl1=0,plb=0;
var iter=45,rep=45,mag=1000,step=2.sqrt.reciprocal;
var sph,sphcart,sphcart1,sph1;
var y=1,x=1,y1=1,x1=1,y2=1,x2=1,y3=1,x3=1;
var y4=1,x4=1,y5=1,x5=1;
var ot=0.degrad,silver=(1+2.sqrt),w=((1+5.sqrt)/2);

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

	az=~az.[pl1];
	pl1=pl1+1;
	y=1;x=1;b=0;pl=0;
	plb=0;y1=1;x1=1;
	~data=~data++data++data1;
};


w = Window.new("3D Scatterplot", Rect(40,40, 800, 800)).front;

~v = UserView.new(w,Rect(0,0,800,800)).background_(Color.black);
a = ScatterView3d(~v, Rect(0,0, 800,800), ~data, [-1000, 1000].asSpec,[-1000, 1000].asSpec,[-1000, 1000].asSpec);
a.drawMethod = \fillRect;
a.symbolSize = 1;
a.symbolColor = Color.white;
a.background = Color.black;

~v.animate;
~v.drawFunc ={
Pen.translate(400,400);

		a.rot(ot,ot,ot);
    ~v.refresh;

		ot=ot+1.degrad;

};
{ while { run } {~v.background_(Color.black); ~v.refresh; (1/1000).wait } }.fork(AppClock);
)


/////////////
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
		az=(az+(360-(360/silver))).wrap(0,360);
el1=0;n=90;
	};
}.value;
)