% example 4.1 Page 85 
% 测试填充前与填充后的高斯低通滤波

clear, clc
% No padding（填充前）
f = imread('bw.png');
f = rgb2gray(f);
[M, N] = size(f);
F = fft2(f);
sig = 0.05 * M;
% GLPF
H = lpfilter('gaussian', M, N, sig);
G = H .* F; 
g = real(ifft2(G));
figure('name', 'original'), imshow(f)
figure('name', '输出图像g'), imshow(g, [])
% m =abs(g - double(f)); the difference between two image
% max(m(:))

% after padding
PQ = paddedsize(size(f));
Fp = fft2(f, PQ(1), PQ(2));
Hp = lpfilter('gaussian', PQ(1), PQ(2), 2 * sig);
Gp = Hp .* Fp;
Gp = real(ifft2(Gp));
gpc = Gp(1 : size(f, 1), 1 : size(f, 2));
figure('name', 'after padding'), imshow(Gp, [])

% 空间域效果
h = fspecial('gaussian', 15, 7);
gs = imfilter(f, h, 'conv', 0, 'same');
figure('name', '空间域'), imshow(gs, [])

