function [U, V] = dftuv(M, N)
% DFTUV Computes meshgrid frequency matrices.
% [U, V] = DFTUV(M, N) computes meshgrid frequency matrices U and V. U and
% V are useful for computing frequency-domain filter functions that can be
% used with DFTFILT. U and V are both M-by-N.
% more details to see the textbook Page 93
%
% [U��V] = DFTUV��M��N����������Ƶ�ʾ���U��V�� U��V���ڼ������DFTFILTһ��ʹ�õ�
% Ƶ���˲������������á� U��V����M-by-N������ϸ�ڼ�������˹�̲�93ҳ

% Set up range of variables.
% ���ñ�����Χ
u = 0 : (M - 1);
v = 0 : (N - 1);

% Compute the indices for use in meshgrid.
% ������������������������ԭ��ת�Ƶ����Ͻǣ���ΪFFT����ʱ�任��ԭ�������Ͻǡ�
idx = find(u > M / 2);
u(idx) = u(idx) - M;
idy = find(v - N / 2);
v(idy) = v(idy) - N;

% Compute the meshgrid arrays.
% �����������
[V, U] = meshgrid(v, u);
