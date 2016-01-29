% This function returns the number dialed from the given audio file
function number = get_number(file)
    % Frequencies associated with each number
    phone_data = [           941, 1336; % 0
                  697, 1209; 697, 1336; 697, 1477; % 1 2 3
                  770, 1209; 770, 1336; 770, 1477; % 4 5 6
                  852, 1209; 852, 1336; 852, 1477]; % 7 8 9

    % Read audio file
    x = audioread(file);
    
    % Length of data
    L = size(x,1);

    % FFT
    Y = fft(x);

    % Absolute Value the FFT and divide by L to scale
    P2 = abs(Y/L);
    
    % Only take left half since data is redundant
    P1 = P2(1:L/2+1);
    
    % Multiply by 2
    P1(2:end-1) = 2*P1(2:end-1);
    
    % Get peak frequencies from frequency domain
    % Must have amplitude > 0.1
    % Transpose so it matches phone data dimensions
    frequencies = transpose(find(P1 > 0.1))-1;
    
    % Find phone number matching frequencies
    [r, c] = ismember(frequencies, phone_data, 'rows');
    
    % Subtract one since indexing is +1 for Matlab
    number = c-1;
end