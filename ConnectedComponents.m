clc;
clear;

mkdir('foreMedian\Contours\');

for i = 1:40
    close all;

    imgName = 'foreMedian\fore-img-';
    imgName = strcat(imgName,int2str(i),'.png');
    I0 = imread(imgName);
    I0 = rgb2gray(I0);
    %level = graythresh(I0);
    %BW = im2bw(I0,level);
    BW = I0 > 20; %what is a better way to define objects
%     figure;
%     subplot(1,2,1);
%     imshow(I0);
%     subplot(1,2,2);
%     imshow(BW);
    
    % find contour
    contours = bwconncomp(BW);
    numObjs = contours.NumObjects
    areaObjs = cellfun(@numel,contours.PixelIdxList);   % Array of contours areas
    
    %[biggest,idx] = max(numPixels);
    
    
    fig = figure;
    [rows, cols] = size(BW);
    
    maxPlotCols = 4;
    maxPlotRows = ceil(numObjs/maxPlotCols);
    minContourArea = 10;
    
    for j=1:numObjs
        mkdir(strcat('foreMedian\Contours\image-', num2str(i)));
        % Only contours with significan area
        if areaObjs(j) > minContourArea
            BW = zeros(rows,cols);
            objPixels = contours.PixelIdxList{j};
            BW(objPixels) = 1;
            
            %subplot(maxPlotRows,maxPlotCols,counter);
            subplot(1,1,1);
            C = contourf(flipud(BW));
            axis off;
            
            saveas(fig, strcat('foreMedian\Contours\image-', num2str(i),'\contour-',num2str(j), '.png'),'png');
        end
    end
end

