%example 5.11 Page 133
% using function DECONVBLIND to recover a fuzzy noise image
PSF = fspecial('gaussian', 7, 10);
subplot(2,2,1)
imshow(pixeldup(PSF, 73),[])
title('�˻�ͼ���PSF')

SD = 0.01;
g = imnoise(imfilter(f, PSF), 'gaussian', 0, SD^2);
INITPSF = ones(size(PSF));
NUMIT = 5;
DAMPAR = 0.1;
LIM = ceil(size(PSF, 1)/2);  % ȡ����size(PSF, 1)/2����С����
WEIGHT = zeros(size(g));
WEIGHT(LIM + 1: end- LIM, LIM + 1:end - LIM) = 1;
[fr, PSFe] = deconvblind(g, INITPSF, NUMIT, DAMPAR, WEIGHT);
subplot(2,2,2)
imshow(pixeldup(PSFe, 73), [])
title('����5�ε�PSF')

NUMIT = 10;
[fr, PSFe] = deconvblind(g, INITPSF, NUMIT, DAMPAR, WEIGHT);
subplot(2,2,3)
imshow(pixeldup(PSFe, 73), [])
title('����10�ε�PSF')

NUMIT = 20;
[fr, PSFe] = deconvblind(g, INITPSF, NUMIT, DAMPAR, WEIGHT);
subplot(2,2,4)
imshow(pixeldup(PSFe, 73), [])
title('����20�ε�PSF')

% ����20�ε�PSF���ӽ����˻�ͼ���PSF��


