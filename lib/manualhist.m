function p = manualhist
% 使用函数twomodegauss函数生成交互式双峰直方图
% 输入中途要退出使用字符x退出
% 输入参数时一次性输入，不要输入x

% 初始化
repeats = true;
quitnow = 'x';
% 计算一个默认的直方图，以防用户在至少评估一个直方图之前退出
p = twomodegauss(0.15, 0.05, 0.75, 0.05, 1, 0.07, 0.002);
% 持续循环，直到输入x
while repeats
    s = input('Enter m1, sig1, m2, sig2, A1, A2, k OR x  to quit:', 's');
    v = str2num(s);
    if s == quitnow
        break;
    end
    % 将输入的字符串转换成一个数值的向量，并且检测输入的个数
    
    if numel(v) ~= 7
        disp(s)
        disp(numel(v))
        disp('Incorrect number of inputs.')
        continue
    end
     
    p = twomodegauss(v(1), v(2), v(3), v(4), v(5), v(6), v(7));
    
    %开始一个新的图形，指定x轴
    figure, plot(p)
    xlim([0 255]);
end

    
    
    
    
