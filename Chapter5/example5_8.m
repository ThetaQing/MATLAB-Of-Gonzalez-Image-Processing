% example 5.8 Page 127
% Using function deconvwnr to recover a fuzzy noise image.

f = checkerboard(8);
f = pixeldup(f, 8);

PSF = fspecial('motion', 7, 45);
gb = imfilter(f, PSF, 'circular');
% ��������Ⱦ��ͼ��
noise = imnoise(zeros(size(f)), 'gaussian', 0, 0.001);
g = gb + noise;
figure('name', '��������Ⱦ��ͼ��')
imshow(g)
title('��������Ⱦ��ͼ��')
% ֱ�����˲�
fr1 = deconvwnr(g, PSF);
% subplot(2, 2, 1)
figure('name', 'ֱ�����˲�')
imshow(fr1)
title('ֱ�����˲�')
% ʹ�ó���������ά���˲�
Sn = abs(fft2(noise)) .^ 2;  % noise power spectrum
nA = sum(Sn(:)) / numel(noise);  % noise average power
Sf = abs(fft2(f) .^ 2);  % image power spectrum
fA = sum(Sf(:)) / numel(f);  % image average power
R = nA / fA;
% 
fr2 = deconvwnr(g, PSF, R);
% subplot(2, 2, 2)
figure('name', 'ʹ�ó���������ά���˲�')
imshow(fr2)
title('ʹ�ó���������ά���˲�')

% ʹ������غ�����ά���˲�
NCORR = fftshift(real(ifft2(Sn)));
ICORR = fftshift(real(ifft2(Sf)));
fr3 = deconvwnr(g, PSF, NCORR, ICORR);
figure('name', 'ʹ������غ�����ά���˲�')
imshow(fr3)
title('ʹ������غ�����ά���˲�')

