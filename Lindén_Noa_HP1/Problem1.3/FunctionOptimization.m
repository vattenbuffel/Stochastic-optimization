%% a
clc; clear all; close all;
[fitnes, x] = GA(0.02);

g = @(x1,x2) (1 + (x1 + x2 +1)^2*(19 - 14*x1 + 3*x1^2 -14*x2 + 6*x1*x2 + 3*x2^2))...
        * (30 + (2*x1-3*x2)^2*(18-32*x1 + 12*x1^2 + 48*x2 - 36*x1*x2 + 27*x2^2));

f_min = g(x(1),x(2));
    
fprintf("The minimum found is: %f. The corresponding x values are:\n", f_min)
disp(x)
fprintf("And the fitness is: %f\n", fitnes);



%% b

% This code works but shouldn't run when FunctionOptimization is called so
% it's commented out

% clc; clear all; close all;
% mutateProbabilities = [0, 0.02, 0.05 0.1];
% nRuns = 100;
% fitnessValues = zeros(size(mutateProbabilities, 2), nRuns);
% nVar = 2;
% d = 10;
% 
% g = @(x1,x2) (1 + (x1 + x2 +1)^2*(19 - 14*x1 + 3*x1^2 -14*x2 + 6*x1*x2 + 3*x2^2))...
%         * (30 + (2*x1-3*x2)^2*(18-32*x1 + 12*x1^2 + 48*x2 - 36*x1*x2 + 27*x2^2));
% 
% 
% for i = 1 : size(mutateProbabilities, 2)
%     for j =1:nRuns
%         fitness = GA(mutateProbabilities(i));
%         fitnessValues(i,j) = fitness;
%     end
%     i
% end
% median(fitnessValues, 2)




%%
function [maximumFitness, xBest] = GA(muteateProb)
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
            chromosome = population(j,:);
            xVars(j,:) = DecodeChromosome(chromosome, nVar, d); 
        end

        % Calculate the fitness of the population
        fitness = zeros(popSize, 1);
        for j=1:popSize
            xVar = xVars(j,:);
            fitness(j, 1) = EvaluateIndividual(xVar);
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
            newIndividual = newPopulation(j,:);
            newPopulation(j,:) = Mutate(newIndividual, mutateProbability);
        end
        

        % Insert the previously best individual
        population = InsertBestIndividual(newPopulation, bestIndividual, nCopiesOfBest);
    end
    
    % Save the xVars of the best individual so that it can be returned
    bestIndividual = population(1,:);
    xBest = DecodeChromosome(bestIndividual, nVar, d);
end

