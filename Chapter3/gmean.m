function v = gmean(A)
% V = GMEAN(A)ʵ�ֶԴ�СΪm * n�������󼸺�ƽ��
% ��СΪm * n������ļ���ƽ��������������ֵ�ĳ˻��� 1/mn ����
% ʹ��colfilltʵ�ַ����Կռ��˲�

% ��������������ȡ����A�������ĳ���
mn = size(A, 1);
% prod(A, DIM)����ά��DIM������˻���Dim = 1������ÿһ����˻�,�൱��prod(A(:,:))
v = prod(A, 1) .^ (1/mn);

% �������д��ڲ��Է���
% f = imread('1.jpg');
% f = rgb2gray(f);
% f = im2double(f);
% f = padarray(f, [5 7], 'replicate');
% g = colfilt(f, [5 7], 'sliding', @gmean);
% imshow(f),figure, imshow(g)

