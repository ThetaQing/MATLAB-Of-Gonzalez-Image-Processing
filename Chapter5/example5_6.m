% example 5.6 Page 122
% adaptivev median filtering.
clear, clc
f = imread('noise.png');
f = rgb2gray(f);
g = imnoise(f, 'salt & pepper', 0.25);
subplot(1, 3, 1)
imshow(g), title('25% ������Ⱦ')

fm = medfilt2(g, [7 7], 'symmetric');
subplot(1, 3, 2)
imshow(fm), title('��ֵ�˲�')

fa = adpmedian(g, 7);  % ��������ʵ�ֹ��̲���
subplot(1, 3, 3)
imshow(fa), title('����Ӧ�˲�')
