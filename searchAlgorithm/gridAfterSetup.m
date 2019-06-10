function [gridAfterFunc] = gridAfterSetup(startGrid, requiredResource)
%gridAfter Returns the state of the grid after action is performend
%also resets total reward if end state is reached
    gridAfterFunc = @gridAfter;
        function grid = gridAfter(stateHistory, totalReward, grid)
        if requiredResource > totalReward
            grid(stateHistory(end,1),stateHistory(end,2)) = -1;
        elseif stateHistory(end,1) ~= stateHistory(1,1) && stateHistory(end,2) ~= stateHistory(1,2)
            grid(:) = -1;
            grid(stateHistory(1,1), stateHistory(1,2)) = 10;
        else
            grid = startGrid;
        end
    end
end

