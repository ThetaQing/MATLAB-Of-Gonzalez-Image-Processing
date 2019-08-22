clc
% example 4.2 Page 89. �ӿռ��˲������Ƶ���˲�������ʹ��Ƶ���˲����˲�

% FFT ����Ҷ�任�õ�Ƶ��
f = imread('6.png');
f = rgb2gray(f);
F = fft2(f);
S = fftshift(log(1 + abs(F)));
S = gscale(S);
figure('name', 'S'), imshow(S)

% filter �ռ�����˲���
h = fspecial('sobel')';
% figure('name', 'freqz2(h)'), freqz2(h)

% ת��ΪƵ���˲���
PQ = paddedsize(size(f));  % ���0֮��ĳߴ�
H = freqz2(h, PQ(1), PQ(2));  % Ƶ���˲���
H1 = ifftshift(H);  % dftfilt��Ƶ���˲����Ƿ����Ļ��ģ�����ת��
% figure('name', 'abs(H)'), imshow(abs(H), [])

% figure('name', 'abs(H1)'), imshow(abs(H1), [])

% �����˲�
gs = imfilter(double(f), h);
figure, imshow(abs(gs), [])

% Ƶ���˲�
gf = dftfilt(f, H1);
figure, imshow(abs(gf), [])
figure, imshow(gf, [])

% creating the binary image to see the margin clearly
% ������ֵͼ����Ը������Ŀ�����Ե
figure, imshow(abs(gs) > 0.2 * abs(max(gs(:))))
figure, imshow(abs(gf) > 0.2 * abs(max(gf(:))))

