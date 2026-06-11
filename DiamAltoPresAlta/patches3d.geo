SetFactory("OpenCASCADE");

Merge "y.step";

HealShapes;

// Mesh resolution
Mesh.CharacteristicLengthMin = 0.10;
Mesh.CharacteristicLengthMax = 0.30;

Mesh.Algorithm = 6;

// Extrude to thin volume
out[] = Extrude {0,0,0.01}
{
    Surface{1};
    Layers{1};
};

// Physical groups
Physical Volume("fluid") = {1};

// front/back (empty later)
Physical Surface("front") = {1};
Physical Surface("back") = {out[0]};

// all side faces
Physical Surface("walls") =
{
    out[2],
    out[3],
    out[4],
    out[5],
    out[6],
    out[7],
    out[8],
    out[9],
    out[10],
    out[11]
};

Mesh.MshFileVersion = 2.2;
