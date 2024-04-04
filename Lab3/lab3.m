% Lab 3. Histograms 

%% H-1. Histograms of artificial images
clearvars; close all; clc;
% a)


black = zeros(256, 256, "uint8");

white = ones(256, 256, "uint8");

black_white = cat(2, zeros(256, 128, "uint8"), 255 * ones(256, 128, "uint8"));

random = randi([0 255], 256, 256, "uint8");


A = zeros(256, 1);
B = A + 1;
transition = cat(2, A, B);
for i=2:255
    transition = cat(2, transition, A+i);
end

transition = uint8(transition);

all = {black, white, black_white, random, transition};
labels = ["black", "white", "black-white", "random", "transition"];


for i=1:5
    subplot(2, 5, i);
    imshow(all{i});
end

for i=1:5
    subplot(2, 5, i+5);
    histogram(all{i}, 0:256);
    subtitle(labels(i));
end

%% H-2. Histograms of greyscale images
clearvars; close all; clc;

lena1 = imread("lena1.bmp");
lena2 = imread("lena2.bmp");
lena3 = imread("lena3.bmp");
lena4 = imread("lena4.bmp");


all = {lena1, lena2, lena3, lena4};

for i=1:8
    if i < 5
        subplot(2, 4, i);
        imshow(all{i});
    else
        subplot(2, 4, i);
        histogram(all{i-4}, 0:256);
    end
end
    
%% H-3. Histogram stretching

clearvars; close all; clc;

hist1 = imread("hist1.bmp");
hist1_stretched = imadjust(hist1);

subplot(2, 2, 1);
imshow(hist1);
subplot(2, 2, 2);
imshow(hist1_stretched);
subplot(2, 2, 3);
histogram(hist1, 0:256);
subplot(2, 2, 4);
histogram(hist1_stretched, 0:256);

%% H-4. Histogram equalization

clearvars; close all; clc;

hist1 = imread("hist1.bmp");
[H, x] = imhist(hist1, 256);
cum_hist1 = cumsum(imhist(hist1, 256));


eqd_hist1 = intlut(hist1, uint8((255/max(cum_hist1)) * cum_hist1));
[H2, x2] = imhist(eqd_hist1, 256);
eqd_cum_hist1 = cumsum(imhist(eqd_hist1, 256));


subplot(2, 3, 1);
imshow(hist1);
title("Original Image");
subplot(2, 3, 2);
histogram(hist1);
subplot(2, 3, 3);
histogram(cum_hist1);

subplot(2, 3, 4);
imshow(eqd_hist1);
title("Equalized Image");
subplot(2, 3, 5);
histogram(eqd_hist1);
subplot(2, 3, 6);
histogram(eqd_cum_hist1);

%% H-5. Histogram matching

clearvars; close all; clc;

load desiredHistogram
phobos = imread("phobos.bmp");

eqd_hist = histeq(phobos, desiredHistogram);

subplot(1, 2, 1);
imshow(eqd_hist);
subplot(1, 2, 2);
imshow(imhistmatch(eqd_hist, desiredHistogram));

subplot(2, 4, 1);
imshow(phobos);

stretched = imadjust(phobos);
eqd = histeq(phobos);
adap_eqd = adapthisteq(phobos);
matched = imhistmatch(imhist(phobos), desiredHistogram);

all = {stretched, eqd, adap_eqd, matched};

for i=1:4
    subplot(2, 4, i);
    imshow(all{i});
end

























