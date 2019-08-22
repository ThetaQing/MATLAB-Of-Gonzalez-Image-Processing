% example 4.6 
% mesh 函数的测试和GHPF滤波的输出图像

% mesh函数测试，适用于surf函数
H = fftshift(hpfilter('gaussian', 500, 500, 50));
figure('name', 'gaussian'), mesh(H(1 : 10:500, 1:10:500));
axis([0 50 0 50 0 1])
colormap([0 0 0])
axis off
grid off
figure('name', 'image of gaussian'), imshow(H, [])

% GHPF滤波
f = imread('6.png');
f = rgb2gray(f);
PQ = paddedsize(size(f));
D0 = 0.05 * PQ(1);
H = hpfilter('gaussian', PQ(1), PQ(2), D0);
g = dftfilt(f, H);
figure('name', '原图'), imshow(f)
figure('name', 'GHPF'), imshow(g, [])