% My arctanh function calculated by continued fraction
% y = x/(1 - ((1x)^2/(3 - ((2x)^2 / (5 - ... )))))
function y = myarctanh_frac(x)
    % Tolerance to stop loop
    tol = 1e-9;
    
    % Initialize Variables for Lentz's Method
    b0 = 1;
    Ajm2 = 1;
    Bjm2 = 0;
    Ajm1 = b0;
    Bjm1 = 1;
    
    % All aj terms are multiplied by -x^2
    a = -x*x;
    
    % Initialize return value for comparison
    y_prev = x;
    
    % Begin loop
    for j = 1:100
        % Calculate aj and bj terms for arctanh
        aj = j*j*a;
        bj = 2*j+1;
        
        % Apply Lentz's Method
        Aj = bj*Ajm1 + aj*Ajm2;
        Bj = bj*Bjm1 + aj*Bjm2;
        y = x/(Aj/Bj);
        
        % Are we accurate enough to stop looping?
        if abs(y - y_prev) < tol
            break;
        end
        
        % Set previous y to current y
        y_prev = y;
        
        % Move variables up 1 for next iteration
        Ajm2 = Ajm1;
        Bjm2 = Bjm1;
        Ajm1 = Aj;
        Bjm1 = Bj;
    end
end