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

% function x = DecodeChromosome(chromosome,nVar,variableRange)
%     nGenes = size(chromosome,2);
%     nHalf = fix(nGenes/2);
% 
%     x(1) = 0.0;
%     for j = 1:nHalf
%         x(1) = x(1) + chromosome(j)*2^(-j);
%     end
%     x(1) =-variableRange + 2*variableRange*x(1)/(1-2^(-nHalf));
% 
%     x(2) = 0.0;
%     for j = 1:nHalf
%         x(2) = x(2) + chromosome(j+nHalf)*2^(-j);
%     end
%     x(2) = -variableRange + 2*variableRange*x(2)/(1-2^(-nHalf));
% 
% end