% exmaple 5.4 Page 115
% 估计噪声参数
f = imread('noise.png');
% 交互式产生掩模
[B, c, r] = roipoly(f);
% 得到ROI的直方图
[p, npix] = histroi(f, c, r);
figure('name', 'histogram of ROI'), bar(p, 1)
% 得到被B覆盖的区域的均值和方差
[v, unv] = statmoments(p, 2)
% 绘制均值是unv(1),方差是unv(2)的高斯噪声直方图
X = imnoise2('gaussian', npix, 1, unv(1), sqrt(unv(2)));
figure('name', 'histogram of gaussian noise'), hist(X, 130)

