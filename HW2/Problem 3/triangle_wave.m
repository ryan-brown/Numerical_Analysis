% Generate triangle wave using Fourier Series given N partial sums
function triangle_wave(N)
    % N must be odd, since only odd coefficients exist for Fourier Series
    if mod(N, 2) == 0
        N = N+1;
    end
    
    % Inital sum
    y = 0;
    
    % Domain
    x = -1:0.001:1;
    
    % Actual triangle wave
    z = -abs(2*x)+1;
    plot(x, z);
    hold on;
    
    % Allocate array for RMS error
    RMS = zeros(1,(N+1)/2);
    
    % Loop through fourier series
    for k = 1:2:N
        % Add next term (coefficient of 8/pi^2 multiplied later)
        y = y + 8*cos(k*pi*x)/(k*k*pi*pi);
        
        % Calculate RMS error for this iteration
        RMS((k+1)/2) = rms_error(y, z);
        
        % Plot this iteration
        plot(x, y);
        hold on;
    end
    
    figure;
    plot(1:2:N, RMS, 1:2:N, RMS);
    xlabel('Nth Fourier Coefficient');
    ylabel('RMS Error');
end