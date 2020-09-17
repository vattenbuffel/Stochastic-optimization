function res = Cross(chromosome1, chromosome2)
    nGenes = size(chromosome1, 2);
    
    crossOverPoint = 1 + fix(rand(1)*(nGenes-1));
    
    newChromosome1 = chromosome1;
    newChromosome2 = chromosome2;
    
    newChromosome1(1,crossOverPoint:end) = chromosome2(1, crossOverPoint:end);
    newChromosome2(1,crossOverPoint:end) = chromosome1(1, crossOverPoint:end);
    
    res = [newChromosome1;newChromosome2];
end


