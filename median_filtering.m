clc;
clear;
close all;

I = imread('noisyImage.png');

figure(1);
imshow(I);
title('Original Image');

Z = I;

[row,column] = size(I);

for x = 2:row-1
    for y = 2:column-1

        median_vals = [I(x-1,y-1), I(x-1,y), I(x-1,y+1), ...
                       I(x,y-1), I(x,y), I(x,y+1), ...
                       I(x+1,y-1), I(x+1,y), I(x+1,y+1)];

        median_vals = sort(median_vals);

        Z(x,y) = median_vals(5);

    end
end

imwrite(Z,'EnhancedImage.png');

figure(2);
imshow(Z);
title('Enhanced Image');
