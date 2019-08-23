% example 5.3 Page 112
% using imnoise3
 C = [0 32; 0 64; 16 16; 32 0; 64 0; -16 16];
 C1 = [6 32; -2 2];
 A1 = [1 5];
 [r, R, S] = imnoise3(512, 512, C1, A1);
 figure('name', 'spectrum'), imshow(S, [])
 figure('name', 'noise'), imshow(r, [])
