clc;
clear;
close all;

I = imread('ad1.png');

[row, column] = size(I);

nk = zeros(1,256);
cHist = zeros(1,256);

% Histogram Calculation
for x = 1:row
    for y = 1:column
        for i = 1:256
            if I(x,y) == i-1
                nk(i) = nk(i) + 1;
                break;
            end
        end
    end
end

% Cumulative Histogram
value = 0;
for i = 1:256
    value = value + nk(i);
    cHist(i) = value;
end

% Histogram Equalization Mapping
sk = zeros(1,256);
for i = 1:256
    sk(i) = cHist(i);
    sk(i) = sk(i)/(row*column);
    sk(i) = round(sk(i)*255);
end

% Create Enhanced Image
Z = zeros(row,column);

for x = 1:row
    for y = 1:column
        for i = 1:256
            if I(x,y) == (i-1)
                Z(x,y) = sk(i);
                break;
            end
        end
    end
end

Z = uint8(Z);

figure;
imshow(I);
title('Original Image');

figure;
imshow(Z);
title('Enhanced Image');
