clc; clear all; close all
popSize = 10;
d = 5;
nGenes = 10;
nVar = 2;
tournementProbability = 0.7;
tournementSize = 5;
mutateProbability = 0.7;


pop = InitializePopulation(popSize, nGenes);

% REMOVE
assert(max(DecodeChromosome(ones(1,nGenes), nVar, d) == d));
assert(max(DecodeChromosome(zeros(1,nGenes), nVar, d) == -d));

% Calculate the xVars of the population
xVars = zeros(popSize, nVar);
for i = 1:popSize
   xVars(i,:) = DecodeChromosome(pop(i,:), nVar, d); 
end

% REMOVE
assert(EvaluateIndividual([2,1]) == 1/(2275))


assert(TournamentSelect([3;2;1], 1, 3) == 1) 
assert(TournamentSelect([3;2;1], 0, 3) == 3)



% Make sure that tounement select picks the fittest individuals the right
% amount of times
nFittestChosen = 0;
epsilon = 0.05;
fitness = [1;2];
tournamentParameter = 0.7;
nRuns = 10000;
for i = 1:nRuns
    winner = TournamentSelect(fitness, tournamentParameter, 2);
    winner = winner - 1;
    nFittestChosen = nFittestChosen + winner;
end
assert(abs(nFittestChosen/nRuns - tournamentParameter) < epsilon)


% Make sure that mutate mutates the right amount of genes
% select picks the fittest individuals the right
% amount of times
assert(sum(Mutate(ones(1,5), 1)) == 0)
assert(sum(Mutate(ones(1,5), 0)) == 5)
assert(sum(Mutate(zeros(1,5), 1)) == 5)
assert(sum(Mutate(zeros(1,5), 0)) == 0)

epsilon = 0.05;
mutateProbability= 0.7;
pop = zeros(100);
mutatedPop = pop;
for i = 1:size(pop, 1)
    mutatedPop(i,:) = Mutate(mutatedPop(i,:),mutateProbability );
end
assert(abs(sum(sum(mutatedPop))/(100*100) -mutateProbability) < epsilon)


nMutated = 0;
epsilon = 0.05;
mutateProbability= 0.7;
pop = ones(100);
mutatedPop = pop;
for i = 1:size(pop, 1)
    mutatedPop(i,:) = Mutate(mutatedPop(i,:),mutateProbability );
end
assert(abs(sum(sum(mutatedPop))/(100*100) - (1-mutateProbability)) < epsilon)


% Check if insertBestIndividual works
[val, idx] = max(fitness);
bestIndividual = pop(idx, :);
newPop = InsertBestIndividual(pop, bestIndividual, 2);
assert(sum(newPop(1,:) - bestIndividual) == 0)


% Check if cross works
nGenes = 1000;
pop = zeros(2,nGenes);
pop(2,:) = 1;

nRuns = 100;
epsilon = 0.05;

sum1 = 0;
sum2 = 0;
for i = 1:nRuns
    newPop= Cross(pop(1,:), pop(2,:));
    sum1 = sum1 + sum(newPop(1,:));
    sum2 = sum2 + sum(newPop(2,:));
end
assert(abs((sum1+sum2)/ (nGenes*nRuns)-1) == 0)

%% a
clc; clear all; close all;
nVar = 2;
d = 10;
pop = GA(0.02);

g = @(x1,x2) (1 + (x1 + x2 +1)^2*(19 - 14*x1 + 3*x1^2 -14*x2 + 6*x1*x2 + 3*x2^2))...
        * (30 + (2*x1-3*x2)^2*(18-32*x1 + 12*x1^2 + 48*x2 - 36*x1*x2 + 27*x2^2));

x = DecodeChromosome(pop(1,:), nVar, d); 
minVal = g(x(1),x(2));
fprintf("The minimum found is: %f. The corresponding x values are:\n", minVal)
disp(x)
fprintf("And the fitness is: %f\n", 1/minVal);



%% b
clc; clear all; close all;
mutateProbabilities = [0, 0.02, 0.05 0.1];
%mutateProbabilities = [0.02];
nRuns = 100;
%nRuns = 25;
fitnessValues = zeros(size(mutateProbabilities, 2), nRuns);
nVar = 2;
d = 10;

g = @(x1,x2) (1 + (x1 + x2 +1)^2*(19 - 14*x1 + 3*x1^2 -14*x2 + 6*x1*x2 + 3*x2^2))...
        * (30 + (2*x1-3*x2)^2*(18-32*x1 + 12*x1^2 + 48*x2 - 36*x1*x2 + 27*x2^2));


for i = 1 : size(mutateProbabilities, 2)
    for j =1:nRuns
        fitness = GA(mutateProbabilities(i));
        fitnessValues(i,j) = fitness;
    end
    i
end
median(fitnessValues, 2)




%%
function [maximumFitness] = GA(muteateProb)
    popSize = 100;
    d = 10;
    nGenes = 50;
    nVar = 2;
    tournementProbability = 0.75;
    tournementSize = 2;
    mutateProbability = muteateProb;
    nCopiesOfBest = 1;
    nGenerations = 100;
    crossoverProbability = 0.8;

    population = InitializePopulation(popSize, nGenes);

    for i=1:nGenerations
        xVars = zeros(popSize, nVar);
        for j = 1:popSize
            xVars(j,:) = DecodeChromosome(population(j,:), nVar, d); 
        end

        % Calculate the fitness of the population
        fitness = zeros(popSize, 1);
        for j=1:popSize
            fitness(j, 1) = EvaluateIndividual(xVars(j,:));
        end

        % Find and save the best individual
        [maximumFitness, idx] = max(fitness);
        bestIndividual = population(idx, :);

        % Find parents via tournament selection
        parentIndices = zeros(popSize, 1);
        for j=1:popSize
            res = TournamentSelect(fitness, tournementProbability, tournementSize);

            parentIndices(j,1) = res;
        end

         % Make new individuals
         newPopulation = zeros(popSize, nGenes);
        for j=1:2:popSize
             parent1Index = parentIndices(j);
            parent2Index = parentIndices(j+1);
            parent1 = population(parent1Index,:);
            parent2 = population(parent2Index,:);
            
            if rand(1,1) < crossoverProbability
                newPopulation(j:j+1,:) = Cross(parent1, parent2);
            else
                newPopulation(j:j+1,:) = [parent1; parent2];
            end
        end
        
        % Mutate the new individuals
        for j=1:popSize
            newPopulation(j,:) = Mutate(newPopulation(j,:), mutateProbability);
        end
        

        % Insert the previously best individual
        population = InsertBestIndividual(newPopulation, bestIndividual, nCopiesOfBest);
    end
    
end

