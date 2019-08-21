function p = manualhist
% ʹ�ú���twomodegauss�������ɽ���ʽ˫��ֱ��ͼ
% ������;Ҫ�˳�ʹ���ַ�x�˳�
% �������ʱһ�������룬��Ҫ����x

% ��ʼ��
repeats = true;
quitnow = 'x';
% ����һ��Ĭ�ϵ�ֱ��ͼ���Է��û�����������һ��ֱ��ͼ֮ǰ�˳�
p = twomodegauss(0.15, 0.05, 0.75, 0.05, 1, 0.07, 0.002);
% ����ѭ����ֱ������x
while repeats
    s = input('Enter m1, sig1, m2, sig2, A1, A2, k OR x  to quit:', 's');
    v = str2num(s);
    if s == quitnow
        break;
    end
    % ��������ַ���ת����һ����ֵ�����������Ҽ������ĸ���
    
    if numel(v) ~= 7
        disp(s)
        disp(numel(v))
        disp('Incorrect number of inputs.')
        continue
    end
     
    p = twomodegauss(v(1), v(2), v(3), v(4), v(5), v(6), v(7));
    
    %��ʼһ���µ�ͼ�Σ�ָ��x��
    figure, plot(p)
    xlim([0 255]);
end

    
    
    
    