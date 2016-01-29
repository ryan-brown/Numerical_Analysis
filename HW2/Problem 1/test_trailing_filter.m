% Test trailing average filter function
function test_trailing_filter()
    % Generate noisy sine wave to filter
    N = 200;
    t = linspace(0, 2, N)';   % Time axis
    f = 1;      % 1 Hz
    An = 0.1;   % Amplitude of noise
    % Create sine wave signal with some random noise on it
    y = sin(2*pi*f*t) + An*randn(size(t));

    % Plot signal
    plot(t, y)
    legend('Noisy Sine Wave');
    hold on

    fprintf('Hit any key to continue...\n')
    pause

    % Now filter the signal Npts=3 & plot the filtered result
    Npts = 3;
    [tf, yf] = trailing_filter(t, y, Npts);
    plot(tf, yf)
    legend('Noisy Sine Wave','Filtered Npts = 3');
    hold on

    fprintf('Hit any key to continue...\n')
    pause

    % Now filter the signal Npts=7 & plot the filtered result
    Npts = 7;
    [tf, yf] = trailing_filter(t, y, Npts);
    plot(tf, yf)
    legend('Noisy Sine Wave','Filtered Npts = 3', 'Filtered Npts = 7');
    hold on

    fprintf('Hit any key to continue...\n')
    pause

    % Now filter the signal Npts=11 & plot the filtered result
    Npts = 11;
    [tf, yf] = trailing_filter(t, y, Npts);
    plot(tf, yf)
    legend('Noisy Sine Wave','Filtered Npts = 3', 'Filtered Npts = 7', 'Filtered Npts = 11');
end
