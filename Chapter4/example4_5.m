% example 4.5. Page 97
% test mesh、surf、meshgrid function
clear, clc
% GLPF
H = fftshift(lpfilter('gaussian', 500, 500, 50));
% mesh 彩色显示
figure('name', 'mesh'), mesh(H(1:10:500, 1:10:500))
figure('name', 'surf'), surf(H(1:10:500, 1:10:500))
axis([0 50 0 50 0 1])
% 转换为黑色，并消除轴和网格
colormap([0 0 0])
axis off
grid off
% 改变观察点位置
% 稍微右移，保持仰角不变
view(-25, 30)
% 保持方向角为-25，仰角设置为0
view(-25, 0)

% meshgrid函数
[Y, X] = meshgrid(-2:0.1:2, -2:0.1:2);
Z  = X .* exp(-X .^ 2 - Y .^ 2);
figure('name', 'meshgrid'), surf(Z)  % Or surf(Z)
shading interp