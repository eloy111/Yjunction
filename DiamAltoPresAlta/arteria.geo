SetFactory("OpenCASCADE");

// Import STEP
Merge "y.step";

// Clean imported geometry
HealShapes;
Coherence;

// Faster 2D mesher
Mesh.Algorithm = 6;   // Frontal-Delaunay

// Coarser initial mesh
Mesh.CharacteristicLengthMin = 0.10;
Mesh.CharacteristicLengthMax = 0.30;

// Export compatibility
Mesh.MshFileVersion = 2.2;
