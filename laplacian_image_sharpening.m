clc;
clear;
close all;

I = imread('fll.png');

figure(1);
imshow(I);
title('Original Image');

Id = im2double(I);

lap_filter = [1 1 1;
              1 -8 1;
              1 1 1];

if size(Id,3) == 1

    L = conv2(Id,lap_filter,'same');
    sharp1 = Id - L;

else

    sharp1 = zeros(size(Id));

    for ch = 1:3
        L = conv2(Id(:,:,ch),lap_filter,'same');
        sharp1(:,:,ch) = Id(:,:,ch) - L;
    end

end

sharp2 = imsharpen(sharp1,'Radius',2,'Amount',2.0,'Threshold',0);

sharp3 = imbilatfilt(sharp2,0.2,3);

o = im2uint8(sharp3);

figure(2);
imshow(o);
title('SUPER Enhanced Image');

imwrite(o,'EnhancedImage_SUPER.png');
