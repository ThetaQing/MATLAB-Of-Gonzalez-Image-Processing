% example 5.12 page 138
% using function VISTFORMFWD
clc,clear
T1 = [3 0 0; 0 2 0; 0 0 1];
tform1 = maketform('affine', T1);
vistformfwd(tform1, [0 100], [0 100]);

T2 = [1 0 0 ;0.2 1 0; 0 0 1];
tform2 = maketform('affine', T2);
vistformfwd(tform2, [0 100], [0 100]);

Tscale = [1.5 0 0; 0 2 0; 0 0 1];
Trotation = [cos(pi/4) sin(pi/4) 0
            -sin(pi/4) cos(pi/4) 0
             0 0 1];
Tshear = [1 0 0; 0.2 1 0; 0 0 1];
T3 = Tscale * Trotation * Tshear;
tform3 = maketform('affine', T3);
vistformfwd(tform3, [0 100], [0 100]);