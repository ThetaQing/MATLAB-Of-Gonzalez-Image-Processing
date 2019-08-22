% example 4.5. Page 97
% test mesh��surf��meshgrid function
clear, clc
% GLPF
H = fftshift(lpfilter('gaussian', 500, 500, 50));
% mesh ��ɫ��ʾ
figure('name', 'mesh'), mesh(H(1:10:500, 1:10:500))
figure('name', 'surf'), surf(H(1:10:500, 1:10:500))
axis([0 50 0 50 0 1])
% ת��Ϊ��ɫ���������������
colormap([0 0 0])
axis off
grid off
% �ı�۲��λ��
% ��΢���ƣ��������ǲ���
view(-25, 30)
% ���ַ����Ϊ-25����������Ϊ0
view(-25, 0)

% meshgrid����
[Y, X] = meshgrid(-2:0.1:2, -2:0.1:2);
Z  = X .* exp(-X .^ 2 - Y .^ 2);
figure('name', 'meshgrid'), surf(Z)  % Or surf(Z)
shading interp