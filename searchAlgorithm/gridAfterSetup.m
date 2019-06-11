function [gridAfterFunc] = gridAfterSetup(startGrid, requiredResource)
%gridAfter Returns the state of the grid after action is performend
%also resets total reward if end state is reached
    gridAfterFunc = @gridAfter;
    endState = false;
        function [grid,reset] = gridAfter(stateHistory, totalReward, grid)
            reset = false;
            if requiredResource > totalReward
                grid(stateHistory(end,1),stateHistory(end,2)) = -1;
            else
                grid(:) = -1;
                grid(stateHistory(1,1), stateHistory(1,2)) = 100;
                endState = true;
            end
            if stateHistory(end,1) == stateHistory(1,1) && stateHistory(end,2) == stateHistory(1,2) && endState
                 grid = startGrid;
                 endState = false;
                 reset = true;
            end
        end
end

