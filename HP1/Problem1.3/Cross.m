function res = Cross(chromosome1, chromosome2)
    nGenes = size(chromosome1, 2);
    
    crossOverPoint = 1 + fix(rand(1)*(nGenes-1));
    
    newChromosome1 = chromosome1;
    newChromosome2 = chromosome2;
    
    newChromosome1(1,crossOverPoint:end) = chromosome2(1, crossOverPoint:end);
    newChromosome2(1,crossOverPoint:end) = chromosome1(1, crossOverPoint:end);
    
    res = [newChromosome1;newChromosome2];
end

% 
% function newChromosomePair = Cross(chromosome1,chromosome2)
%     nGenes = size(chromosome1,2); % Both chromosomes must have
%     % the same length!
%     crossoverPoint = 1 + fix(rand*(nGenes-1));
% 
%     newChromosomePair = zeros(2,nGenes);
%     for j = 1:nGenes
%         if (j <= crossoverPoint)
%             newChromosomePair(1,j) = chromosome1(j);
%             newChromosomePair(2,j) = chromosome2(j);
%         else
%             newChromosomePair(1,j) = chromosome2(j);
%             newChromosomePair(2,j) = chromosome1(j);
%         end
%     end
% end