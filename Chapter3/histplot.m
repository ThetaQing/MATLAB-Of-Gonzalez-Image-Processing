f = imread('phobos.png');
f = rgb2gray(f);
g = histeq(f);
imshow(f), figure, imshow(g)
figure, imhist(f)
ylim('auto')
xlim('auto')
figure, imhist(g)
ylim('auto')
xlim('auto')
