function gausshpf( a )
% References: 
%   1. http://www.acfr.usyd.edu.au/courses/amme4710/Lectures/AMME4710-Chap4-FrequencyFiltering.pdf
%   2. https://www.mathworks.com/matlabcentral/answers/32209-how-to-find-center-of-an-image-other-than-using-regionprops
%   3. class slides: Spatial Frequency Analysis I: Highpass filters slide

    % distance from the origin. Ref.(1)
    Do = 50;

    % Obtaining coordinates for center of image. Ref(2)
    [k,l] = size(a);
    p = k/2;
    q = l/2;
    
    % Creating the high-pass filter.
    for i=1:k
        for j=1:l
           
            % Gaussian HighPass Filter formula, Ref.(3).
            
            %  The distance between a point (i,j) and the
            %  centre of the frequency. Ref.(1)
            distCenter = sqrt( (i-p)^2+(j-q)^2 );
            H(i,j) = 1-exp( -(distCenter)^2/( 2*(Do^2) ) );
        end
    end
    
    % Performing fourier transform and shifting average to center. 
    shift = fftshift(fft2(a));
    
    % Performing convolution to produce filtered image
    b = shift.*H;
    
    % Black values are grayish if abs() is not used. Not sure why...
    img = abs(ifft2(b));
    figure, imshow(img, []), title('Gaussian HP filtered Image');
end

