function [v, unv] = statmoments(p, n)
% STATMOMENTS Computes statistical central moments of image histogram.
%   [W, UNV] = STATMOMENTS(P, N) computes up to the Nth statistical central
%   moment of a histogram whose components are in vector P. The length of P
%   must equal 256 or 65536.
%   The program outputs a vetctor V with V(1) = mean, V(2) = variance, V(3)
%   = 3rd moment, ... V(N) = Nth central moment. The random moments also
%   are in this range.
%   The program alse outputs a vector UNV containing the same moments as V,
%   but using un-normalized random variable values(e.g., 0 to 255 if
%   length(P) = 2^8). For example, length(p) = 256, v(1) = 0.5,  
%   unv(1) = 127.5

Lp = length(p);
if(Lp ~= 256) & (Lp ~= 65536)
    error('P must be a 256- or 65535-element vector.')
end
G = Lp - 1;
% Make sure the histogram has unit area, and convert it to a colum vector.
p = p / sum(p);
p = p(:);
% Form a vector of all the possible values of the random variable.
z = 0 : G;
% Now normalize the z's to the range [0, 1].
z = z ./ G;
% The mean
m = z * p;
% Center random variables about the mean.
z = z - m;
% Compute the central moments.
v = zeros(1, n);
v(1) = m;
for j = 2 : n
    v(j) = (z .^ j) * p;
end
if nargout > 1
    % Compute the uncentralized moments.
    unv = zeros(1, n);
    unv(1) = m .* G;
    for j = 2 : n
        unv(j) = ((z * G) .^ j) * p;
    end
end

