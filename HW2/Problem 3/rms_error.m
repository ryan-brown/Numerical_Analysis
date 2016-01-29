function error = rms_error(x, y)
    error = 0;
    l = length(x);
    for i = 1:l
       error = error + (x(i)-y(i))*(x(i)-y(i));
    end

    
    error = sqrt(error/l);
end