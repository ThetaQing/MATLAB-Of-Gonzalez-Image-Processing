H = fftshift(hpfilter('gaussian', 500, 500, 50));
figure('name', 'btw'), mesh(H(1 : 10:500, 1:10:500));
axis([0 50 0 50 0 1])
colormap([0 0 0])
axis off
grid off
figure('name', 'image of btw'), imshow(H, [])

f = imread('6.png');
f = rgb2gray(f);
PQ = paddedsize(size(f));
D0 = 0.05 * PQ(1);
H = hpfilter('gaussian', PQ(1), PQ(2), D0);
g = dftfilt(f, H);
figure('name', 'ԭͼ'), imshow(f)
figure('name', 'GHPF'), imshow(g, [])