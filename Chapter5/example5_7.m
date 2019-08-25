% exmaple 5.7 Page 124
% ģ������ͼ��Ľ�ģ
clear, clc
% �������԰�
f = checkerboard(8);
subplot(2, 2, 1)
imshow(f)
title('Cheakerboard')
% �����˻�ͼ��
PSF = fspecial('motion', 7, 45);
gb = imfilter(f, PSF, 'circular');
subplot(2, 2, 2)
imshow(gb)
title('PSF')
% ����ͼ������
noise = imnoise(zeros(size(f)), 'gaussian', 0, 0.001);
subplot(2, 2, 3)
imshow(noise)
title('Noise')
% ������������˻���ͼ��ģ��
g = gb + noise;
subplot(2, 2, 4)
imshow(g, [])
title('�˻���ͼ��ģ��')
% ��ͼ��f�Ŵ�
figure('name', '��ͼ��f�Ŵ�8��')
imshow(pixeldup(f, 8), [])
title('pixeldup')

