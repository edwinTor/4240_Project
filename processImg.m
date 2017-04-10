function processImg( img )
%FILTERNEW Summary of this function goes here
%   Detailed explanation goes here

    [a,b] = size(img); % get an image size for generality
    s = 50; % sub image size; could ask user
    sm1 = s-1; % temporary for to limit recomputes

    for i = 1:s:a
        for j = 1:s:b
            subimg = img( i:i+sm1, j:j+sm1 );
            c = mod(i,50);
            v = mod(j,50);
            if ( c == 1) && ( v == 1 )
                img(i:i+sm1, j:j+sm1) = filter(subimg);
                %img(i:i+sm1, j:j+sm1) = subimg;
                %figure, imshow(img);
            end
        end
    end
    figure, imshow(img);
end

