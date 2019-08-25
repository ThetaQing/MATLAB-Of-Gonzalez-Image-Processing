function B=pixeldup(A, m, n)
% PIXELDUP Duplicates pixels of an image in both dorections.
%   B = PIXELDUP(A, M, N) duplicates each pixel of A M times in the
%   vertical direction and N times in the horizontal direction. Parameters
%   M and N must be integers. If N is not included, it defaluts to M.

% Chiease: pixeldup�����ظ����صģ���ˮƽ������m�����ڴ�ֱ������n����m��n����Ϊ������
% nû�и�ֵĬ��Ϊm.

% ��������������
if nargin < 2
    error('At least two inputs are required.');
end
if nargin == 2
    n = m;
end
% ����һ����������������Ԫ�صĸ���ΪA������
u = 1:size(A, 1);
% ����������ÿ��Ԫ��m��
m = round(m); % ��ֹmΪ������
u = u(ones(1,m), :);
u = u(:);
% �ڴ�ֱ�����ظ�����
v = 1:size(A, 2);
n = round(n);
v = v(ones(1, n), :);
v = v(:);
% ����ֵ
B = A(u, v);