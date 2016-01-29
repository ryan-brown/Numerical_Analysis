% My arctanh function calculated by looping partial sum of Taylor Series
% y = x(1 + x^2/3 + x^4/5 + ...)
function y = myarctanh_series(x)
    % Running sum for result
    sum = 1;
    
    % Current term value (excluding denominator)
    term = 1;
    
    % Tolerance to stop loop
    tol = 1e-9;

    % Begin looping, starting at x^2 term
    for i = 2:2:1000
        % Calculate current term and add to sum
        term = x*x*term;
        denom = term/(i+1);
        sum = sum + denom;

        % Are we accurate enough to stop looping?
        if(denom < tol)
            break;
        end
    end
    
    % Multiply in remaining x from Taylor Series factoring and return
    y = x*sum;
end