% example 5.5 Page 119
% Using function spfilt
f = imread('noise.png');
f = rgb2gray(f);
[M, N] = size(f);

% 被概率为0.1的胡椒噪声污染
R = imnoise2('salt & pepper', M, N, 0.1, 0);
c = find(R == 0);
gp = f;
gp(c) = 0;
subplot(2,3,1)
imshow(gp)
title('pepper')

% 过滤胡椒噪声采用Q为正值的反调和滤波器
fp = spfilt(gp, 'chmean', 3, 3, 1.5);
subplot(2,3,2), imshow(fp)
title('after chmean of pepper')

% 过滤胡椒噪声最大值滤波器
fp = spfilt(gp, 'max', 3, 3);
subplot(2,3,3), imshow(fp)
title('after max of pepper')

% 被概率为0.1的盐粒噪声污染
R = imnoise2('salt & pepper', M, N, 0, 0.1);
c = find(R == 1);
gs = f;
gs(c) = 255;
subplot(2,3,4),  imshow(gs), title('salt'),

% 过滤盐粒噪声采用Q为负值的反调和滤波器
fs = spfilt(gs, 'chmean', 3, 3, -1.5);
subplot(2,3,5), imshow(fs)
title('after chmean of salt')

% 过滤盐粒噪声采用min滤波器
fs = spfilt(gs, 'min', 3, 3);
subplot(2,3,6), imshow(fs)
title('after min of salt')

