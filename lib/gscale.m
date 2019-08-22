function g=gscale(f,varargin)
% GSACLE函数实现对输入图像的标度
% G = GSACLE(F, 'full8')将图像标度到[0, 255]全范围，默认值
% G = GSACLE(F, 'full16')将图像标度到[0, 65535]全范围
% G = GSACLE(F, 'minmax', Low, High)将图像标度到[Low, High]全范围，注意，Low，High
% 的范围为[0, 1],具体范围由输入决定，即输入输出的class一致。
% 如果输入图像是double类，并且值不在[0, 1]的范围内，那么在标度之前要进行转换


if isempty(varargin) % 对代码进行优化，该语句比 if length(varargin) == 0 快
    method='full8'; % 采用默认值
else
    method=varargin{1};
end
% 预处理
if strcmp(class(f),'double')&(max(f(:))>1 | min(f(:))<0)
    f=mat2gray(f);
end
% 实现标度
switch method
    case 'full8'
        g=im2uint8(mat2gray(double(f)));
    case 'full16'
        g=im2uint16(mat2gray(double(f)));
    case 'minmax'
        low = varargin{2};high = varargin{3};
        if low>1 | low<0 |high>1 | high<0 % 判断参数是否合法
            error('Parameters low and high must be in the range [0,1]')
        end
        if strcmp(class(f),'double')
            low_in=min(f(:));
            high_in=max(f(:));
        elseif strcmp(class(f),'uint8')
            low_in=double(min(f(:)))./255;
            high_in=double(max(f(:)))./255;
        elseif strcmp(class(f),'uint16')
            low_in=double(min(f(:)))./65535;
            high_in=double(max(f(:)))./65535;
        end
         g=imadjust(f,[low_in high_in],[low high]);
    otherwise
        error('Unknown method')
end
