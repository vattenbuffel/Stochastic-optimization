function res = InitializePopulation(populationSize, nGenes)
    res = (rand(populationSize, nGenes) < 0.5)*1;
end
