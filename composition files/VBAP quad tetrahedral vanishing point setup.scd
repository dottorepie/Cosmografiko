

// ////cube
// (
// ~az=[45.degrad,135.degrad,45.neg.degrad,135.neg.degrad,45.degrad,135.degrad,45.neg.degrad,135.neg.degrad];
// ~el=[35.264390.neg.degrad,35.264390.neg.degrad,35.264390.neg.degrad,35.264390.neg.degrad,35.264390.degrad,35.264390.degrad,35.264390.degrad,35.264390.degrad];
// );

/////tetrahedron1
(
~az=[45.degrad,135.neg.degrad,45.neg.degrad,135.degrad];
~el=[35.264390.neg.degrad,35.264390.neg.degrad,35.264390.degrad,35.264390.degrad];
)


/////tetrahedron2
(
~az=[45.degrad,135.neg.degrad,45.neg.degrad,135.degrad];
~el=[35.264390.degrad,35.264390.degrad,35.264390.neg.degrad,35.264390.neg.degrad];
)

~a = VBAPSpeakerArray.new(3, [[~az.[0], ~el.[0]], [~az.[1], ~el.[1]], [~az.[2], ~el.[2]], [~az.[3], ~el.[3]]]);
	 ~b = Buffer.loadCollection(s, ~a.getSetsAndMatrices);





///speaker setup configuration is to be an azimuthal quad setup (superposition) or prefered distortions of this, like assymetrical, random position quad setups,
///spatial 3d sound tetrahedral spheric or parabolic setups, or other according to listening room, in any case the superposition is a one plane quad of
///FL,FR,BL,BR. wether this plane is transformed or tilted towards some an elevation is up to the installers preferencies.


///The virtual setup (VBAP) is a platonic tetrahedron as seen in ~az, ~el arrays, so that the panning output of the composition spatial spheric coordinated can remain
//3D in its tensor and information, regardless if the physical setup is azimuthal only, or any other propable quad installation.

///To be exact the virtual to real, to actuall logic of the overall setup follows the method of vanishing points. Each physical speaker location of the quad setup, is
///to be imagined as a vanishing point in a cubic realm but also a vertice of one or the two tetrahedrons that form this cube as a vertice diagonals.
/// Having a quad setup means there are four vanishing points, or two which can be panned to four positions (four sides of the quad plane)
///Each of these vanishing points, being the verices of a tetrahedron (two of the same tetrahedron) create a triangular scope on the tetrahedral plane frontally to the correspndent
///vertice.

///Essentially this means that we employ 2 VBAP tetrahdeon arrays which are orthogonal to eachother having the az1/az2 and el1/el2 relation to 0/90 -90/90
///(together forming virtually a cube).
////Each physical channel output represents two verices of each tetrahedron, namely of the same elevation for each. This would follow to a quad plane of four points with
///azimuth and elevation angle degrees coordinates of p1=[45,-35.264390], p2=[135,-35.264390], p3=[-45,35.264390], p4=[-135,35.264390], whereas p1,p2 is the first
///vanishing point pair and p3,p4 the second pair.
///In practice if the two VBAP objects output two tetrahdral channels sets ar channels [4,5,6,7] and [8,9,10,11] then the physical output channels is
///a simple re-routing of channels 4->0, 11->1, 6->2, 9->3. Or simply using only channels 4,6,9,11 as lines for the speakers in this sequence.

///In simpler words and practice, also handier as an interface and as musical information, would be to have an initial cubic VBAP (8ch). From this a set of four channels can be
//abstracted according to the binary tetrahedral geometry of the cube described above, and distributed to the quad speaker lines, which four channels set is to be chosen [4,6,8,11]
///or [5,7,8,10] can be the task of a bipolar panner that routes provides the appropriate routing. In essense outputting all the VBAP cube channels simulteniously on the
///quad setup would simply be mixing down this channels to [4+6,8+11,5+7,8+10]


///In particular this concept can be written in the SynthDef with two VBAP outputs, one for every of the following orthognal tetrahedra
/////tetrahedron1
(
Server.default = s = Server.local;
////server setup
(
s.options.numWireBufs = 1024*4;
s.options.numOutputBusChannels=4;
s.options.numInputBusChannels=0;
TempoClock.default.tempo_(1);
s.options.memSize = 8192*4;
//s.options.sampleRate= 44100;
);

s.waitForBoot{
	Buffer.freeAll;
(
~az1=[45.degrad,135.neg.degrad,45.neg.degrad,135.degrad];
~el1=[35.264390.neg.degrad,35.264390.neg.degrad,35.264390.degrad,35.264390.degrad];
);
/////tetrahedron2
(
~az2=[45.degrad,135.neg.degrad,45.neg.degrad,135.degrad];
~el2=[35.264390.degrad,35.264390.degrad,35.264390.neg.degrad,35.264390.neg.degrad];
);

(
~a1 = VBAPSpeakerArray.new(3, [[~az1.[0], ~el1.[0]], [~az1.[1], ~el1.[1]], [~az1.[2], ~el1.[2]], [~az1.[3], ~el1.[3]]]);
	 ~b1 = Buffer.loadCollection(s, ~a1.getSetsAndMatrices);
	);

	(
~a2 = VBAPSpeakerArray.new(3, [[~az2.[0], ~el2.[0]], [~az2.[1], ~el2.[1]], [~az2.[2], ~el2.[2]], [~az2.[3], ~el2.[3]]]);
	 ~b2 = Buffer.loadCollection(s, ~a2.getSetsAndMatrices);
	);

({
var sig,out1,out2,pan1,pan2,phase1,phase2,equlibrium,p_amp1=0.5,p_amp2=0.5;

		equlibrium=MouseX.kr(0.degrad,90.degrad).poll;
	phase1=0.degrad; phase2=equlibrium;

	sig=SinOsc.ar(440,mul:0.1);

	pan1=SinOsc.ar(1/2,phase:phase1,mul:p_amp1); pan2=SinOsc.ar(1/2,phase:phase2,mul:p_amp2);

out1=Out.ar(0,VBAP.ar(4,sig,~b1.bufnum,SinOsc.ar(1/4,0.degrad,180),0,70)*pan1);

out2=Out.ar(0,VBAP.ar(4,sig,~b2.bufnum,SinOsc.ar(1/4,90.degrad,180),0,70)*pan2);

}.play)}
)


///note that the panning modulators create spatial rhythmic patterns in the speaker array, constructive and destructive interferance, which can be in sync with
///the rythmic patterns of the dur arguments of the Synthdef Patterns and routines. Modulating the amp between the two VBAP pans the signal from one tetrahedral
//array of the cube to the other. Halting this pan and mixing the two equally, collapses the cube to an azimuthal quad in 2D or to a tetrahedron in 3D, as this collapse,
//in 3D space forces the azimuthal interpolation to extend rotationally to a tetrahedral interpolation in 3D space. In turn when this quad collapses, two points remain,
//which then collapse the fabric of the cosmos itself, begetting a new cosmic cycle via big bang and a reditribution of the cloud matter array outwards, from the monad heat-death
///limit