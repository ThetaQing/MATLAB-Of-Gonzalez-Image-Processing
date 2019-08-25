% example 5.8 Page 127
% Using function deconvwnr to recover a fuzzy noise image.

f = checkerboard(8);
f = pixeldup(f, 8);

PSF = fspecial('motion', 7, 45);
gb = imfilter(f, PSF, 'circular');
% 被噪声污染的图案
noise = imnoise(zeros(size(f)), 'gaussian', 0, 0.001);
g = gb + noise;
figure('name', '被噪声污染的图案')
imshow(g)
title('被噪声污染的图案')
% 直接逆滤波
fr1 = deconvwnr(g, PSF);
% subplot(2, 2, 1)
figure('name', '直接逆滤波')
imshow(fr1)
title('直接逆滤波')
% 使用常数比例的维纳滤波
Sn = abs(fft2(noise)) .^ 2;  % noise power spectrum
nA = sum(Sn(:)) / numel(noise);  % noise average power
Sf = abs(fft2(f) .^ 2);  % image power spectrum
fA = sum(Sf(:)) / numel(f);  % image average power
R = nA / fA;
% 
fr2 = deconvwnr(g, PSF, R);
% subplot(2, 2, 2)
figure('name', '使用常数比例的维纳滤波')
imshow(fr2)
title('使用常数比例的维纳滤波')

% 使用自相关函数的维纳滤波
NCORR = fftshift(real(ifft2(Sn)));
ICORR = fftshift(real(ifft2(Sf)));
fr3 = deconvwnr(g, PSF, NCORR, ICORR);
figure('name', '使用自相关函数的维纳滤波')
imshow(fr3)
title('使用自相关函数的维纳滤波')

