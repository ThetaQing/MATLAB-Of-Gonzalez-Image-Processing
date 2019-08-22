f = imread('6.png');
f = rgb2gray(f);

% 得到填充参数
PQ = paddedsize(size(f));
% 得到到指定点的距离
[U, V] = dftuv(PQ(1), PQ(2));
% 设置截止参数
D0 = 0.05 * PQ(2);
% 得到输入图像填充之后的傅里叶变换
F = fft2(f, PQ(1), PQ(2));
% 高斯低通滤波器
H = exp(-(U .^ 2 + V .^ 2) / (2 * (D0 ^ 2)));
% 得到经过滤波的输出图像
g = dftfilt(f, H);
% 显示
figure('name', '原图'), imshow(f)
figure('name', '未fftshift的滤波器'), imshow(H, [])
figure('name', '滤波器'), imshow(fftshift(H), [])
figure('name', '未fftshift的频谱'), imshow(log(1 + abs(F)), [])
figure('name', '频谱'), imshow(log(1 + abs(fftshift(F))), [])
figure('name', '输出图像'), imshow(g, [])