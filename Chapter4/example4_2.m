clc
% example 4.2 Page 89. 从空间滤波器获得频域滤波器，并使用频域滤波器滤波

% FFT 傅里叶变换得到频谱
f = imread('6.png');
f = rgb2gray(f);
F = fft2(f);
S = fftshift(log(1 + abs(F)));
S = gscale(S);
figure('name', 'S'), imshow(S)

% filter 空间域的滤波器
h = fspecial('sobel')';
% figure('name', 'freqz2(h)'), freqz2(h)

% 转化为频域滤波器
PQ = paddedsize(size(f));  % 填充0之后的尺寸
H = freqz2(h, PQ(1), PQ(2));  % 频域滤波器
H1 = ifftshift(H);  % dftfilt的频域滤波器是非中心化的，进行转换
% figure('name', 'abs(H)'), imshow(abs(H), [])

% figure('name', 'abs(H1)'), imshow(abs(H1), [])

% 空域滤波
gs = imfilter(double(f), h);
figure, imshow(abs(gs), [])

% 频域滤波
gf = dftfilt(f, H1);
figure, imshow(abs(gf), [])
figure, imshow(gf, [])

% creating the binary image to see the margin clearly
% 创建二值图像可以更清晰的看到边缘
figure, imshow(abs(gs) > 0.2 * abs(max(gs(:))))
figure, imshow(abs(gf) > 0.2 * abs(max(gf(:))))

