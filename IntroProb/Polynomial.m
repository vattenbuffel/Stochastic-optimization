function res = Polynomial(x, coeffs)
    %Calculate res = coeffs(1) + coeffs(2)*x + coeffs(3)*x^2...
    res = coeffs(1);
    for i=2:length(coeffs)
        res = res + coeffs(i)*x.^(i-1);
    end
end