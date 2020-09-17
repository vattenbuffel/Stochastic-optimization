function population = InsertBestIndividual(population, bestIndividual, nCopiesOfBest)
    for i = 1:nCopiesOfBest
        population(i, :) = bestIndividual(1,:);
    end
end