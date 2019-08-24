% exmaple 5.4 Page 115
% ������������
f = imread('noise.png');
% ����ʽ������ģ
[B, c, r] = roipoly(f);
% �õ�ROI��ֱ��ͼ
[p, npix] = histroi(f, c, r);
figure('name', 'histogram of ROI'), bar(p, 1)
% �õ���B���ǵ�����ľ�ֵ�ͷ���
[v, unv] = statmoments(p, 2)
% ���ƾ�ֵ��unv(1),������unv(2)�ĸ�˹����ֱ��ͼ
X = imnoise2('gaussian', npix, 1, unv(1), sqrt(unv(2)));
figure('name', 'histogram of gaussian noise'), hist(X, 130)

