% cube via catadioptric camera

cam = CatadioptricCamera('name', 'panocam', ...
         'projection', 'equiangular', ...
         'maxangle', pi/4, ...
         'pixel', 10e-6, ...
         'resolution', [1280 1024])
[X,Y,Z] = mkcube(1, 'centre', [1, 1, 0.8], 'edge');
cam.mesh(X, Y, Z)

rvcprint('hidden', cam.h_image.Parent)