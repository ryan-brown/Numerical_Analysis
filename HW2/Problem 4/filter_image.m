% Blurs given image using low pass filter with fft2
function filtered_img = filter_image(img)
    % Read image data
    img_data = imread(img);
    
    % Get dimensions of image
    [img_h, img_w] = size(img_data);
    
    % Get dimension halves for filtering
    img_h2 = round(img_h/2);
    img_w2 = round(img_w/2);
    
    % Display Image
    figure;
    imshow(img_data, [0,256]);
    
    % fft2
    y = fft2(img_data);
    
    % Shift fft information
    shifted = fftshift(y);
    
    % Display shifted fft of image
    figure;
    imshow(abs(shifted),[0 256*256]);
    
    % Radius to filter by
    r = 15;
    
    % Filter image fft by zeroing out all data outside inner circle
    % Low Pass Filter
    filtered_shifted = shifted;
    for i = 1:img_h
        for j = 1:img_w
            if (img_h2-i)*(img_h2-i) + (img_w2-j)*(img_w2-j) > r*r
                filtered_shifted(i, j) = 0;
            end
        end
    end
    
    % Display new filtered fft
    figure;
    imshow(abs(filtered_shifted),[0 256*256]);
    
    % Inverse fft the filtered data
    filtered_img = ifft2(fftshift(filtered_shifted));
    
    % Display new filtered image
    figure;
    imshow(abs(filtered_img),[0,256])
end