clc; clear all; close all;
populationSize = 30;
numberOfGenes = 40;
crossoverProbability = 0.8;
mutationProbability = 0.025;
tournamentSelectionParameter = 0.75;
variableRange = 3.0;
fitness = zeros(populationSize,1);

% population = InitializePopulation(populationSize, numberOfGenes);