function res = DecodeChromosome(chromosome, nVar, varRange)
    m = size(chromosome, 2);
    n = nVar;
    k = m/n;
    nGenes = k;
    
    res = zeros(1,nVar);
    for i=1:nVar
        sumTerm = 0;
        for j=1:nGenes
            xDone = i-1;
            sumTerm = sumTerm + 2^(-j)*chromosome(xDone*nGenes + j);
        end
        
       x = -varRange + 2*varRange/(1-2^(-k))* sumTerm;
       res(1,i) = x;
    end
    
end

