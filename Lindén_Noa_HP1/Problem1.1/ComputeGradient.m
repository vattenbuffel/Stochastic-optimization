function gradFp = ComputeGradient(x1Val, x2Val, muuVal)
    gradFp = [2*x1Val-2
              4*x2Val-8];
    
    % Handle the case where g is not fulfilled
    if x1Val^2 + x2Val^2 -1 > 0
        gradFp = gradFp + 4*muuVal*[x1Val*(x1Val^2+x2Val^2-1)
                                x2Val*(x1Val^2+x2Val^2-1)];
    end  
end