
for i = 1:40
    close all;
    fig = figure;
    tic;
    
    foreGround = I2 - frame{i};
    imshow(foreGround);
    display(tic);
    saveas(fig, strcat('fore\fore-img-', num2str(i), '.png'),'png');
end


