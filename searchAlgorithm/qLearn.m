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
            QActionIndex = 1;
            for qActions = qState*4-3:qState*4
                QAction(QActionIndex) = Q(stateHistory(end,1),stateHistory(end,2),qActions); %returns the Q for the s value of the action taken as determined by tryAction 
                QActionIndex = QActionIndex + 1;
            end
            [isZero,action] = max(QAction);  %QAction is 1x4 matrix
            if all(isZero == QAction)   %truly random if all actions are equally weighted
                action = ceil(numActions * rand);
            end
        else
            action = ceil(numActions * rand);
        end
        action = action+qState*4-4;
        %% execute action
        stateHistory = [stateHistory;tryAction(stateHistory(end,:), action, actionFunc, grid)];
        reward = grid(stateHistory(end,1),stateHistory(end,2));
        totalReward = totalReward + reward;
        [grid, reset] = gridAfterFunc(stateHistory, totalReward, grid, qState);
        
        if figOn
            drawGrid(grid, stateHistory, 5, fig)
            %disp(totalReward)
            disp(QAction)
        end

        %% Update Q value
        QActionIndex = 1; 
        for qActions = qState*4+1:qState*4+4 %find new max Q values in new state for all actions 
                QAction(QActionIndex) = Q(stateHistory(end,1),stateHistory(end,2), qActions); %returns the Q for the s value of the action taken as determined by tryAction 
                QActionIndex = QActionIndex + 1;
        end

        Q(stateHistory(end-1,1),stateHistory(end-1,2),action) = (1-alphaRate)*Q(stateHistory(end-1,1),stateHistory(end-1,2),action) + alphaRate*(reward + lambda*max(QAction));
        if reset
            totalReward = 0;
            qState = 0;
            if reset == 2
                stateHistory = [stateHistory;stateHistory(1,1),stateHistory(1,2)];
            end
        end
    end
end

