% example 5.6 Page 122
% adaptivev median filtering.
clear, clc
f = imread('noise.png');
f = rgb2gray(f);
g = imnoise(f, 'salt & pepper', 0.25);
subplot(1, 3, 1)
imshow(g), title('25% 椒盐污染')

fm = medfilt2(g, [7 7], 'symmetric');
subplot(1, 3, 2)
imshow(fm), title('中值滤波')

fa = adpmedian(g, 7);  % 函数具体实现过程不懂
subplot(1, 3, 3)
imshow(fa), title('自适应滤波')
