% example 5.5 Page 119
% Using function spfilt
f = imread('noise.png');
f = rgb2gray(f);
[M, N] = size(f);

% ������Ϊ0.1�ĺ���������Ⱦ
R = imnoise2('salt & pepper', M, N, 0.1, 0);
c = find(R == 0);
gp = f;
gp(c) = 0;
subplot(2,3,1)
imshow(gp)
title('pepper')

% ���˺�����������QΪ��ֵ�ķ������˲���
fp = spfilt(gp, 'chmean', 3, 3, 1.5);
subplot(2,3,2), imshow(fp)
title('after chmean of pepper')

% ���˺����������ֵ�˲���
fp = spfilt(gp, 'max', 3, 3);
subplot(2,3,3), imshow(fp)
title('after max of pepper')

% ������Ϊ0.1������������Ⱦ
R = imnoise2('salt & pepper', M, N, 0, 0.1);
c = find(R == 1);
gs = f;
gs(c) = 255;
subplot(2,3,4),  imshow(gs), title('salt'),

% ����������������QΪ��ֵ�ķ������˲���
fs = spfilt(gs, 'chmean', 3, 3, -1.5);
subplot(2,3,5), imshow(fs)
title('after chmean of salt')

% ����������������min�˲���
fs = spfilt(gs, 'min', 3, 3);
subplot(2,3,6), imshow(fs)
title('after min of salt')

