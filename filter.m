function n = filter( img )

    thres = 0;
    [a,b] = size(img);
    maxValue = max(img(:));
    fprintf('%d\n',maxValue);
    if maxValue < 10000
        thres = 2500;
    elseif maxValue < 11000
        thres = 2500;
    elseif maxValue > 11000 && maxValue < 12000
        thres = 2500; 
    elseif maxValue > 12000 && maxValue < 13000
        thres = 3500;
    elseif maxValue > 13000 && maxValue < 14000
        thres = 3500; 
    elseif maxValue > 14000 && maxValue < 15000
        thres = 4000;
    elseif maxValue > 15000 && maxValue < 16000
        thres = 4500;
    elseif maxValue > 16000
        thres = 5500; 
    end
    
    for i=1:a
            for j=1:b
                if img(i,j) == maxValue || img(i,j) > maxValue - thres
                    img(i,j) = intmax('uint16');
                else
                    img(i,j) = 0;
                end
            end
    end
    n = img;
    
end

