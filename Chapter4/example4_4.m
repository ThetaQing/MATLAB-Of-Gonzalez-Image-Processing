f = imread('6.png');
f = rgb2gray(f);

% �õ�������
PQ = paddedsize(size(f));
% �õ���ָ����ľ���
[U, V] = dftuv(PQ(1), PQ(2));
% ���ý�ֹ����
D0 = 0.05 * PQ(2);
% �õ�����ͼ�����֮��ĸ���Ҷ�任
F = fft2(f, PQ(1), PQ(2));
% ��˹��ͨ�˲���
H = exp(-(U .^ 2 + V .^ 2) / (2 * (D0 ^ 2)));
% �õ������˲������ͼ��
g = dftfilt(f, H);
% ��ʾ
figure('name', 'ԭͼ'), imshow(f)
figure('name', 'δfftshift���˲���'), imshow(H, [])
figure('name', '�˲���'), imshow(fftshift(H), [])
figure('name', 'δfftshift��Ƶ��'), imshow(log(1 + abs(F)), [])
figure('name', 'Ƶ��'), imshow(log(1 + abs(fftshift(F))), [])
figure('name', '���ͼ��'), imshow(g, [])