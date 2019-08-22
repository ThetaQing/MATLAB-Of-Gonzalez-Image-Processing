function [U, V] = dftuv(M, N)
% DFTUV Computes meshgrid frequency matrices.
% [U, V] = DFTUV(M, N) computes meshgrid frequency matrices U and V. U and
% V are useful for computing frequency-domain filter functions that can be
% used with DFTFILT. U and V are both M-by-N.
% more details to see the textbook Page 93
%
% [U，V] = DFTUV（M，N）计算网格频率矩阵U和V。 U和V对于计算可与DFTFILT一起使用的
% 频域滤波器函数很有用。 U和V都是M-by-N。更多细节见冈萨雷斯教材93页

% Set up range of variables.
% 设置变量范围
u = 0 : (M - 1);
v = 0 : (N - 1);

% Compute the indices for use in meshgrid.
% 计算网格的索引，即将网络的原点转移到左上角，因为FFT计算时变换的原点在左上角。
idx = find(u > M / 2);
u(idx) = u(idx) - M;
idy = find(v - N / 2);
v(idy) = v(idy) - N;

% Compute the meshgrid arrays.
% 计算网格矩阵
[V, U] = meshgrid(v, u);
