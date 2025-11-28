

						//phase=Complex(sph.theta.linlin(pi.neg,pi,1.neg,1),sph.phi.linlin((pi/2).neg,(pi/2),1.neg,1)).theta;
			per=Spherical(360.degrad,sph.theta,sph.phi);
			phase=(per.x+per.y+per.z).wrap(2pi.neg,2pi);//////////////////!!!!!!!




////


(
 var copper=0,bank=5,angle;
 bank.do{ 	copper=(copper+(360-(360/1.6180339887499))).wrap(0, 360).round(0.00000001);
	if(copper>180,{copper=180-copper},{copper=copper});
	copper.postln;
 } )