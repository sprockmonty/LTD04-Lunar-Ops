function [Q] = qLearn(grid, numActions, Q, stateHistory, etaGreedy, alphaRate, lambda, actionFunc, gridAfterFunc, fig, figOn, iterations, requiredResource)
%qLearn Learns based off grid
%   INPUTS
%       figOn - bool, should you draw figures
    totalReward = 0;
    qState = 0;
    for t = 1:iterations
        %% Select action
        qState = qState+1;
        if rand > etaGreedy
            for qActions = 1:numActions
                QAction(qActions) = Q(stateHistory(end,1),stateHistory(end,2),qActions); %returns the Q for the s value of the action taken as determined by tryAction 
            end
            [isZero,action] = max(QAction);  %QAction is 1x4 matrix
            if all(isZero == QAction)   %truly random if all actions are equally weighted
                action = ceil(numActions * rand);
            end
        else
            action = ceil(numActions * rand);
        end
        %% execute action
        stateHistory = [stateHistory;tryAction(stateHistory(end,:), action, actionFunc, grid)];
        reward = grid(stateHistory(end,1),stateHistory(end,2));
        totalReward = totalReward + reward;
        [grid, reset] = gridAfterFunc(stateHistory, totalReward, grid);
        if reset
            totalReward = 0;
            qState = 0;
        end
        if figOn
            drawGrid(grid, stateHistory, 5, fig)
            disp(totalReward)
        end
        %% Update Q value
        for qActions = 1:numActions %find new max Q values in new state for all actions
                QAction(qActions) = Q(stateHistory(end,1),stateHistory(end,2), qActions); %returns the Q for the s value of the action taken as determined by tryAction 
        end
        Q(stateHistory(end-1,1),stateHistory(end-1,2),action) = (1-alphaRate)*Q(stateHistory(end-1,1),stateHistory(end-1,2),action) + alphaRate*(reward + lambda*max(QAction));
    end
end

