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
title('�˻�ͼ��')

DAMPAR = 0.1;
LIM = ceil(size(PSF, 1)/2);  % ȡ����size(PSF, 1)/2����С����
WEIGHT = zeros(size(g));
WEIGHT(LIM + 1: end- LIM, LIM + 1:end - LIM) = 1;
NUMIT = 5;
fr = deconvlucy(g, PSF, NUMIT, DAMPAR, WEIGHT);
subplot(2,2,2)
imshow(fr)
title('����5�εĸ�ԭͼ��')


NUMIT = 10;
fr = deconvlucy(g, PSF, NUMIT, DAMPAR, WEIGHT);
subplot(2,2,3)
imshow(fr)
title('����10�εĸ�ԭͼ��')

NUMIT = 20;
fr = deconvlucy(g, PSF, NUMIT, DAMPAR, WEIGHT);
subplot(2,2,4)
imshow(fr)
title('����20�εĸ�ԭͼ��')
