function mutatedChromosome = Mutate(chromosome, mutateProbability)
    nGenes = size(chromosome,2);
    mutatedChromosome = chromosome;
    for i = 1 : nGenes
       if rand(1) < mutateProbability
          mutatedChromosome(1,i) =  1 - chromosome(1,i);
       end
    end
end

% function mutatedChromosome = Mutate(chromosome,mutationProbability)
%     nGenes = size(chromosome,2);
%     mutatedChromosome = chromosome;
%     for j = 1:nGenes
%         r = rand;
%         if (r < mutationProbability)
%             mutatedChromosome(j) = 1-chromosome(j);
%         end
%     end
% end