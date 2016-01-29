% Problem 1
function y = mytanh(x)
    y = (exp(x)-exp(-x))/(exp(x)+exp(-x));
end