H = 3;
L = 10;
B = 1;

dz = 0.1;
dx = 0.1;
x = (dx/2):dx:(L-dx/2);
z = dz/2:dz:(H-dz/2);
z_face = 0:dz:H;

dv = dx*dz*B;

Ni = length(x);
Nj = length(z);

cellmark = ones(Ni,Nj);
cellmark(:,1) = 2;
cellmark([1,end],:) = 3;
cellmark([1,1],[end,1])=4;
