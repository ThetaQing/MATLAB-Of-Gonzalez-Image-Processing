function v = gmean(A)
% V = GMEAN(A)实现对大小为m * n的邻域求几何平均
% 大小为m * n的邻域的几何平均是邻域内亮度值的乘积的 1/mn 次幂
% 使用colfillt实现非线性空间滤波

% 返回行数，即获取矩阵A列向量的长度
mn = size(A, 1);
% prod(A, DIM)，沿维度DIM进行求乘积，Dim = 1，即对每一列求乘积,相当于prod(A(:,:))
v = prod(A, 1) .^ (1/mn);

% 在命令行窗口测试范例
% f = imread('1.jpg');
% f = rgb2gray(f);
% f = im2double(f);
% f = padarray(f, [5 7], 'replicate');
% g = colfilt(f, [5 7], 'sliding', @gmean);
% imshow(f),figure, imshow(g)

