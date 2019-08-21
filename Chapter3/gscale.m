function g=gscale(f,varargin)
% GSACLE����ʵ�ֶ�����ͼ��ı��
% G = GSACLE(F, 'full8')��ͼ���ȵ�[0, 255]ȫ��Χ��Ĭ��ֵ
% G = GSACLE(F, 'full16')��ͼ���ȵ�[0, 65535]ȫ��Χ
% G = GSACLE(F, 'minmax', Low, High)��ͼ���ȵ�[Low, High]ȫ��Χ��ע�⣬Low��High
% �ķ�ΧΪ[0, 1],���巶Χ����������������������classһ�¡�
% �������ͼ����double�࣬����ֵ����[0, 1]�ķ�Χ�ڣ���ô�ڱ��֮ǰҪ����ת��


if isempty(varargin) % �Դ�������Ż��������� if length(varargin) == 0 ��
    method='full8'; % ����Ĭ��ֵ
else
    method=varargin{1};
end
% Ԥ����
if strcmp(class(f),'double')&(max(f(:))>1 | min(f(:))<0)
    f=mat2gray(f);
end
% ʵ�ֱ��
switch method
    case 'full8'
        g=im2uint8(mat2gray(double(f)));
    case 'full16'
        g=im2uint16(mat2gray(double(f)));
    case 'minmax'
        low = varargin{2};high = varargin{3};
        if low>1 | low<0 |high>1 | high<0 % �жϲ����Ƿ�Ϸ�
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
