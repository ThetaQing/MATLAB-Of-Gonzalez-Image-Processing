f = imread('bw.png');
% f = rgb2gray(f);
[M, N] = size(f);
F = fft2(f);
sig = 10;
H = lpfilter('gaussian', M, N, sig);
G = H(1) .* f;
g = real(ifft2(G));
imshow(f), figure, imshow(g, [])

PQ = paddedsize(size(f));
Fp = fft2(f, PQ(1), PQ(2));
Hp = lpfilter('gaussian', PQ(1), PQ(2), 2 * sig);
Gp = Hp(1) .* Fp;
Gp = real(ifft2(Gp));
gpc = Gp(1 : size(f, 1), 1 : size(f, 2));
figure, imshow(Gp, [])


h = fspecial('gaussian', 15, 7);
gs = imfilter(f, h, 'conv', 0, 'same');
figure, imshow(gs, [])

