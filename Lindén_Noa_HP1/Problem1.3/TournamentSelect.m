function res = TournamentSelect(fitnessValues, probabilityHighestFitness, tournamentSize)
    % Make a unique list of contenders
    while 1==1
        contendersIndex = round(rand(tournamentSize, 1) * (size(fitnessValues,1)-1)) + 1;
        if length(contendersIndex) == length(unique(contendersIndex))
           break 
        end
    end
    
    while 1==1
        if rand(1) < probabilityHighestFitness
            % Select the individual with the highest fitness
            contendersFitness = fitnessValues(contendersIndex);
            winnerFitness = max(contendersFitness);
            res = find(fitnessValues == winnerFitness);
            res = res(1); % This will almost always only happen when both of the best individuals of the previous generation are in the same tournament batch
            return
        else
            % Remove the individual with highest fitness
            contendersFitness = fitnessValues(contendersIndex);
            contendersIndex(indexWithMaxValue(contendersFitness)) = [];
            
            % If there's only 1 individual left it should be chosen
            if size(contendersIndex,1) == 1
               res = contendersIndex(1);
               return
            end
        end
    end
    

end

function res = indexWithMaxValue(vector)
    maxVal = max(vector);
    
    for i=1:size(vector, 1)
        if vector(i) == maxVal
            res = i;
            return;
        end
    end
end


