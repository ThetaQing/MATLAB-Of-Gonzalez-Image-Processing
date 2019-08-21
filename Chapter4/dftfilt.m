function g = dftfilt(f, H)
% DFTFILT performs frequency domain filtering.
%   G = DFTFILT(F, H) filters F in the frequency domain using the filter
%   transfer function H. The output, G, is the filtered image, which has
%   the same size as F. DFTFILT automatically pads F to be the same size as
%   H. Function PADEDESIZE can be used to determine an appropriate size
%   for H.
%   G = DFTFILT��F��H��ʹ���˲������ݺ���H��Ƶ���ж�����ͼ��F�˲��� ���G���˲����ͼ��
%   ���С��F��ͬ��DFTFILT�Զ���F��䵽��H��ͬ�Ĵ�С ��PADEDESIZE����������ȷ��H�ĺ��ʴ�С��
%
%   DFTFILT assumes that F is real and that H is a real, uncentered,
%   circularly-symmetric filter function.
%   DFTFILT����F��ʵ����H��ʵ����δ���ģ�ѭ���ԳƵ��˲�������

% Obtain the FFT of the padded input.
% ��ȡ���֮���FFT�任
F = fft2(f, size(H, 1), size(H, 2));
% Perform filtering
% �˲�
g = real(ifft2(H .* F));
% Crop to orihinal size
% ���е�ԭʼ�ߴ�
g = g(1 : size(f, 1), 1 : size(f, 2));