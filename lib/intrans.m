function g = intrans(f, varargin)
% 亮度变换的M函数，实现负片变换、对数变换、gamma变换和对比度拉伸变换。
% 第三章 3.2.3
% G = INTRANS(F, 'neg') computes thr nrgative of input iamge F.
% 计算输入图像F的负数,即补图像
%
% G = INTRANS(F, 'log', C, CLASS) computes C * log(1 + F) and multiplies
% the result by (positive) constant C. CLASS : the class of output as
% 'unit8'/'uint16'.
% 实现对数转换
%
% G = INTERANS(F, 'gamma', GAM): a gamma transformation on the input iamge
% using parameter GAM.
% 实现gamma转换
%
% G = INTERANS(F, 'stretch', M, E): a contrast-stretching transformation
% using 1./(1 + (M ./(F+eps)).^E).  Parameter M [0, 1],default 
% M = mean2(im2double(F)), and E default to 4.
% 实现对比度拉伸

% 检测输入参数是否合法
narginchk(2, 4)
% 存储输入图片的class
classin = class(f);
% 如果输入类别是double，并且不在[0, 1]范围内，并且具体变换不是‘log’，将输入转换到[0, 1]
if strcmp(class(f), 'double') & max(f(:)) > 1 & ~strcmp(varargin{1}, 'log')
    f = mat2gray(f);
else % 转换到double
    f = im2double(f);
end
% 确定具体的变换
method = varargin{1};
% 进行变换
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
% 转换成输入图像的类别
g = changeclass(classin, g);


    



