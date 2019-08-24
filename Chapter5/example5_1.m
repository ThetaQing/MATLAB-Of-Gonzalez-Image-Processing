% example 5.1 Page 105
% 使用均匀随机生成具有批定分布的随机数

clear, clc
a = 3;
b = 4;
M = 4;
N = 4;
R = a + sqrt(b * log(1 - rand(M, N)));
bar(hist(R))