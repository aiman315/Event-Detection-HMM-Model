clc;
clear;

I0 = imread('_MG_0001.JPG');
I0 = rgb2gray(I0);
sumImage = double(I0);

for i = 2:40
   imgName = '_MG_00';
   if ( i < 10 )
       imgName = strcat(imgName,'0');
   end
   imgName = strcat(imgName,int2str(i),'.JPG');
   rgbImage = imread(imgName);
   rgbImage = rgb2gray(rgbImage);
   sumImage = sumImage + double(rgbImage);
end
meanImage = sumImage/40;
figure;
imgz = imshow(meanImage, []);

