function res = NewtonRaphsonStep(xj, fPrimOfxj, fBisOfxj)
    % Check for faulty imput
    if fBisOfxj == 0
        fprintf("NewtonRaphsonStep: Faulty input. fBisOfxj can't be zero, zeroDivisionError.\n");
        res = "ERROR";
        return
    end
    
    res = xj - fPrimOfxj / fBisOfxj;
end