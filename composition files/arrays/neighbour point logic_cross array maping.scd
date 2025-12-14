				//////localization areas on the sphere array
	(	{~points = ~az.collect({ |az, i|Spherical(1, az, ~el[i]);})}.value;);

	(	{var n=1.neg,neighbors;
		~neighbors=[];
		(361*12).do{n=n+1;
		~center = Spherical(1, ~az.[n], ~el.[n] );
~threshold = 	0.5;
	neighbors = ~points.select { |pt|
		Quaternion(0,pt.x,pt.y,pt.z).distance(Quaternion(0,~center.x,~center.y,~center.z)) < ~threshold};
			~neighbors=~neighbors.add(neighbors);
}}.value;);

	~thetaArray = ~neighbors.collect(_.theta);
     ~phiArray = ~neighbors.collect(_.phi);
