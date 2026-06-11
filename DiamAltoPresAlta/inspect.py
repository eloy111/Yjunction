import gmsh
gmsh.initialize()
gmsh.open("yjunction.msh")
for dim, tag in gmsh.model.getEntities(2):
    bbox = gmsh.model.getBoundingBox(dim, tag)
    print(f"Surface {tag}: bbox = {bbox}")
gmsh.finalize()
