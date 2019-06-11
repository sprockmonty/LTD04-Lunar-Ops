function [gridAfterFunc] = gridAfterSetup(startGrid, requiredResource, numMoves)
%gridAfter Returns the state of the grid after action is performend
%also resets total reward if end state is reached
    gridAfterFunc = @gridAfter;
    endState = false;
        function [grid,reset] = gridAfter(stateHistory, totalReward, grid, qState)
            reset = false;
            if requiredResource > totalReward
                grid(stateHistory(end,1),stateHistory(end,2)) = -1;
            else
                grid(:) = -1;
                grid(stateHistory(1,1), stateHistory(1,2)) = 500;
                endState = true;
            end
            if (stateHistory(end,1) == stateHistory(1,1) && stateHistory(end,2) == stateHistory(1,2) && endState)
                 grid = startGrid;
                 endState = false;
                 reset = true;
            end
            if qState == numMoves-1
                grid = startGrid;
                endState = false;
                reset = 2;
            end
        end
end

