f = imread('1.jpg');
f = rgb2gray(f);
F = fft(f);
Fc= fftshift(F);
S2 = log(1 + abs(Fc));
s = abs(F);
imshow(S2, []),figure, imshow(Fc, [])
