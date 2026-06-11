SetFactory("OpenCASCADE");

Merge "y.step";

HealShapes;

// Mesh
Mesh.CharacteristicLengthMin = 0.010;
Mesh.CharacteristicLengthMax = 0.30;

Mesh.Algorithm = 6;
Mesh.Algorithm3D = 1;  // Delaunay

// Extrude
out[] = Extrude {0,0,0.01}
{
    Surface{1};
    Layers{1};
    Recombine;
};

// out[0] → top surface
// out[1] → volume
// out[2:] → lateral surfaces (one per boundary curve)

// Physical volume
Physical Volume("fluid") = {out[1]};

// Front/back
Physical Surface("front") = {1};
Physical Surface("back")  = {out[0]};

// THESE indices follow the original curve order
Physical Surface("wall")        = {out[2], out[4], out[5], out[7], out[9], out[11]};
Physical Surface("inlet")       = {out[3]};   // Curve 2
Physical Surface("outletLeft")  = {out[6]};   // Curve 5
Physical Surface("aneurysm")    = {out[8]};   // Circle 7
Physical Surface("outletRight") = {out[10]};  // Curve 9

Mesh.RecombineAll = 0;  // 0 = Disable hex recombination
Mesh.MshFileVersion = 2.2;

