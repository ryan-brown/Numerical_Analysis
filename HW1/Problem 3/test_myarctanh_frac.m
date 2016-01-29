% My arctanh test function
% Tests accuracy over range of acceptable inputs compared to matlab
function test_myarctanh_frac()
    % Loop x values within range [-0.95, 0.95]
    for x = -0.95:0.05:0.95
        % Tolerance required to be considered accurate
        tol = 1e-8;
        
        % Values for matlab and my function
        matlab = atanh(x);
        mine = myarctanh_frac(x);
        diff = abs(mine-matlab);
        
        % Print results
        fprintf('| x = %20.18e |\n| y_comp = %20.18e |\n| y_true = %20.18e |\n| diff = %20.18e |\n\n', x, mine, matlab, diff);
        
        % Check if failure
        if(diff >= tol)
            error('TEST FAILED!');
        end
    end
    
    fprintf('TEST PASSED!\n');
end