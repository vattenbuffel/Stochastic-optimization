function res = PolynomialDifferentiation(coeffs, differentialOrder)
    % check for faulty input
    if differentialOrder < 0
       fprintf("PolynomialDifferentiation: differnetialOrder may not be negative!\n")
       return 
    end
    
    % Differentiate the polynomial whose coefficients are given by coeffs
    for i=1:differentialOrder
       for j=differentialOrder+1:length(coeffs) % This starts att differentialOrder+1 because the earlier terms will be differentiated away
           power = j-i;
           coeffs(j) = coeffs(j)*power;
       end
    end
    
    res = coeffs(differentialOrder+1:end);
end