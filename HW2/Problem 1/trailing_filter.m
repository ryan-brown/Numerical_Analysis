% Trailing Average Filter given Time data t, Plot data x, and Npts number of points
% to average
function [tf, yf] = trailing_filter(t, x, Npts)
    % Get length of data and allocate variables for filtered data
    Nx = length(x);
    yf = zeros(Nx-Npts+1, 1);
    tf = zeros(Nx-Npts+1, 1);

    % Loop over input and generate filtered output
    for n = Npts:Nx
        % Range of points to average
        idx = (n-Npts+1):n;
        
        % Generate output by averaging trailing data
        tf(n-Npts+1) = t(n);
        yf(n-Npts+1) = sum(x(idx))/Npts;
    end
end

