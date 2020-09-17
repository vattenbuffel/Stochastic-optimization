function mutatedChromosome = Mutate(chromosome, mutateProbability)
    nGenes = size(chromosome,2);
    mutatedChromosome = chromosome;
    for i = 1 : nGenes
       if rand(1) < mutateProbability
          mutatedChromosome(1,i) =  1 - chromosome(1,i);
       end
    end
end

