function g = intrans(f, varargin)
% ���ȱ任��M������ʵ�ָ�Ƭ�任�������任��gamma�任�ͶԱȶ�����任��
% ������ 3.2.3
% G = INTRANS(F, 'neg') computes thr nrgative of input iamge F.
% ��������ͼ��F�ĸ���,����ͼ��
%
% G = INTRANS(F, 'log', C, CLASS) computes C * log(1 + F) and multiplies
% the result by (positive) constant C. CLASS : the class of output as
% 'unit8'/'uint16'.
% ʵ�ֶ���ת��
%
% G = INTERANS(F, 'gamma', GAM): a gamma transformation on the input iamge
% using parameter GAM.
% ʵ��gammaת��
%
% G = INTERANS(F, 'stretch', M, E): a contrast-stretching transformation
% using 1./(1 + (M ./(F+eps)).^E).  Parameter M [0, 1],default 
% M = mean2(im2double(F)), and E default to 4.
% ʵ�ֶԱȶ�����

% �����������Ƿ�Ϸ�
narginchk(2, 4)
% �洢����ͼƬ��class
classin = class(f);
% ������������double�����Ҳ���[0, 1]��Χ�ڣ����Ҿ���任���ǡ�log����������ת����[0, 1]
if strcmp(class(f), 'double') & max(f(:)) > 1 & ~strcmp(varargin{1}, 'log')
    f = mat2gray(f);
else % ת����double
    f = im2double(f);
end
% ȷ������ı任
method = varargin{1};
% ���б任
switch method
    case 'neg'
        g = imcomplement(f);
    case 'log'
        if length(varargin) == 1
            c = 1;
        elseif length(varargin) == 2
            c = varargin{2};
        elseif length(varagin) == 3
            c = varargin{2};
        end
        g = c * (log(1 + double(f)));
    case 'gamma'
        if length(varargin) < 2
            error('Not enough inputs for thr gamma option.')
        end
        gam = varargin{2};
        g = imadjust(f, [], [], gam);
    case 'stretch'
        if length(varargin) == 1
            m = mean2(f);
            E = 4.0;
        elseif length(varargin) == 3
            m = varargin{2};
            E = varargin{3};
        else
            error('Incorrect number of inputs for the stretch option.')
        end 
        g = 1 ./ (1 + (m ./(f + eps)) .^ E);
    otherwise
        error('Unknown enhancement method.')
end
% ת��������ͼ������
g = changeclass(classin, g);


    



