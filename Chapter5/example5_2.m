% example 5.2. Page 110
% using function imnoise2 to draw the hist
clear, clc

% gaussian
r = imnoise2('gaussian', 100000, 1);
p = hist(r, 50);
subplot(2,3,1)
bar(p)
title('gaussian')
% xlim([ -5 5])

% uniform
r = imnoise2('uniform', 100000, 1);
p = hist(r, 50);
subplot(2,3,2)
bar(p)
title('uniform')
% xlim([0 1])


% lognormal
r = imnoise2('lognormal', 100000, 1);
p = hist(r, 50);
subplot(2,3,3)
bar(p)
title('lognormal')
% xlim([0 3.5])

% rayleigh
r = imnoise2('rayleigh', 1, 10000, 0, 8);
p = hist(r, 50);
subplot(2,3,4)
bar(p)
title('rayleigh')
% xlim([0 3.5])

% exponential
r = imnoise2('exponential', 100000, 1);
p = hist(r, 50);
subplot(2,3,5)
bar(p)
title('exponential')
% xlim([0 14])

% erlang
r = imnoise2('erlang', 100000, 1);
p = hist(r, 50);
subplot(2,3,6)
bar(p)
title('erlang')
% xlim([0 12])

% erlang
r = imnoise2('salt & pepper', 1, 1000);
p = hist(r, 50);
figure('name', 'salt & pepper')
bar(p)
title('salt & pepper')
% xlim([0 12])