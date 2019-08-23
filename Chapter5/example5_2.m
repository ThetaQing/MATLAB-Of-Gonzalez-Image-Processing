% example 5.2. Page 110
% using function imnoise2 to draw the hist
clear, clc

% gaussian
r = imnoise2('gaussian', 100000, 1, 0, 1);
p = hist(r, 50);
subplot(2,3,1)
bar(p)
title('gaussian')

% uniform
r = imnoise2('uniform', 100000, 1, 0, 1);
p = hist(r, 50);
subplot(2,3,2)
bar(p)
title('uniform')

% salt & pepper
r = imnoise2('salt & pepper', 20, 20, 0.05, 0.05);
p = hist(r, 50);
subplot(2,3,3)
bar(p)
title('salt&pepper')

% lognormal
r = imnoise2('lognormal', 100000, 1, 1, 0.25);
p = hist(r, 50);
subplot(2,3,4)
bar(p)
title('lognormal')

% rayleigh
r = imnoise2('rayleigh', 20, 20, 1, 4);
p = hist(r, 50);
subplot(2,3,5)
bar(p)
title('raleigh')

% erlang
r = imnoise2('erlang', 100000, 1, 2, 5);
p = hist(r, 50);
subplot(2,3,6)
bar(p)
title('erlang')