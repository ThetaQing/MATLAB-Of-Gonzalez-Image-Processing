% exmaple 5.7 Page 124
% 模糊噪声图像的建模
clear, clc
% 产生测试板
f = checkerboard(8);
subplot(2, 2, 1)
imshow(f)
title('Cheakerboard')
% 产生退化图像
PSF = fspecial('motion', 7, 45);
gb = imfilter(f, PSF, 'circular');
subplot(2, 2, 2)
imshow(gb)
title('PSF')
% 产生图像噪声
noise = imnoise(zeros(size(f)), 'gaussian', 0, 0.001);
subplot(2, 2, 3)
imshow(noise)
title('Noise')
% 添加噪声构造退化的图像模型
g = gb + noise;
subplot(2, 2, 4)
imshow(g, [])
title('退化的图像模型')
% 将图像f放大
figure('name', '将图像f放大8倍')
imshow(pixeldup(f, 8), [])
title('pixeldup')

