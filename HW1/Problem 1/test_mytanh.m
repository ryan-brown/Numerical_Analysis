% Problem 1 Test
function test_mytanh()
    % Text x values 1e-10, 1e-9, ... , 1e9, 1e10
    for x = 10.^[-10:10]
        % Compute values and error
        comp = mytanh(x);
        true = tanh(x);
        diff = abs(comp-true);
        rel_err = diff/true;
        
        % Print results
        fprintf('x: %10.18e\nComputed Value: %10.18e\nTrue Value: %10.18e\nDifference: %10.18e\nRelative Error: %10.18e\n\n', x, comp, true, diff, rel_err);
    end
end