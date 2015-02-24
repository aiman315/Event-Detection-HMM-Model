clc;
clear;

for i = 1:40
   imgName = '_MG_00';
   if ( i < 10 )
       imgName = strcat(imgName,'0');
   end
   imgName = strcat(imgName,int2str(i),'.JPG');
   rgbImage = imread(imgName);
   frame{i} = rgb2gray(rgbImage);
end
[rowsI, colsI] = size(frame{1});

I2 = frame{i};
pixVec = zeros(1,40);


for r = 1:rowsI
    for c = 1:colsI
        for i = 1:40
            pixVec(i) = frame{i}(r,c);
        end
        I2(r,c) = median(pixVec);
    end
end
figure;
imshow(I2);
