% example 5.10 Page 131
% using function DECONVLUCY to recover a fuzzy noise image.

% exmaple 5.9 Page 129
% Using deconvreg to recover a fuzzy noise image

f = checkerboard(8);
noise = imnoise(zeros(size(f)), 'gaussian', 0, 0.001);
PSF = fspecial('motion', 7, 45);
g = imfilter(f, PSF, 'circular');
g = g + noise;
subplot(2,2,1)
imshow(g)
title('退化图像')

DAMPAR = 0.1;
LIM = ceil(size(PSF, 1)/2);  % 取大于size(PSF, 1)/2的最小整数
WEIGHT = zeros(size(g));
WEIGHT(LIM + 1: end- LIM, LIM + 1:end - LIM) = 1;
NUMIT = 5;
fr = deconvlucy(g, PSF, NUMIT, DAMPAR, WEIGHT);
subplot(2,2,2)
imshow(fr)
title('迭代5次的复原图像')


NUMIT = 10;
fr = deconvlucy(g, PSF, NUMIT, DAMPAR, WEIGHT);
subplot(2,2,3)
imshow(fr)
title('迭代10次的复原图像')

NUMIT = 20;
fr = deconvlucy(g, PSF, NUMIT, DAMPAR, WEIGHT);
subplot(2,2,4)
imshow(fr)
title('迭代20次的复原图像')
