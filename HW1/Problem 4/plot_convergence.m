% Loop index
i = 1;

% Preallocating for speed
atanh_series = zeros(39,2);
atanh_frac = zeros(39,2);

% Loop x values
for x = -0.95:0.05:0.95
    % Series vs Fraction matrices
    atanh_series(i,:) = [x, myarctanh_series_iter(x)];
    atanh_frac(i,:) = [x, myarctanh_frac_iter(x)];
    i = i+1;
end

% Plot series vs fraction
figure;
plot(atanh_series(:,1), atanh_series(:,2), 'o', atanh_frac(:,1), atanh_frac(:,2), 'o');
legend('Series Expansion', 'Continued Fraction');
xlabel('Input x');
ylabel('Iterations required for convergence');