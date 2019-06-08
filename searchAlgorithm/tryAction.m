function [stateResult] = tryAction(inState, action, actionFunc, grid)
%tryAction Try to see what the result of taking an action will be
%   INPUTS:
%       action - action trying to take
%       actionFunc - function of the action to be taken
%       grid - the grid of resources
%   OUTPUTS:
%       stateResult - the resultant state based on if the action is
%       possible
    stateResult = actionFunc(inState ,action);
    gridSize = length(grid);
    if sum(stateResult(:) > gridSize) || sum(stateResult(:) < 1)
        stateResult = inState;
    end
end

