% example 4.1 Page 85 
% �������ǰ������ĸ�˹��ͨ�˲�

clear, clc
% No padding�����ǰ��
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
figure('name', '���ͼ��g'), imshow(g, [])
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

% �ռ���Ч��
h = fspecial('gaussian', 15, 7);
gs = imfilter(f, h, 'conv', 0, 'same');
figure('name', '�ռ���'), imshow(gs, [])

