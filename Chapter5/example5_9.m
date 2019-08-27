% exmaple 5.9 Page 129
% Using deconvreg to recover a fuzzy noise image

f = checkerboard(8);
noise = imnoise(zeros(size(f)), 'gaussian', 0, 0.001);
PSF = fspecial('motion', 7, 45);
g = imfilter(f, PSF, 'circular');
g = g + noise;
subplot(1,3,1)
imshow(g)
title('ÍË»¯Í¼Ïñ')

fr = deconvreg(g, PSF, 4);
subplot(1,3,2)
imshow(fr)
title('¸´Ô­Í¼Ïñ')

fr = deconvreg(g, PSF, 0.4, [1e-7 1e7]);
subplot(1,3,3)
imshow(fr)
title('¸´Ô­Í¼Ïñ')
