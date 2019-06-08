function [] = drawGrid(grid, stateHistory, history, figure)
%drawGrid Draws grid of rover location and resources
%   INPUTS:
%       grid - n x m grid of resources and current values
%       stateHistory - n x 2 history of states with current state at the end
%       where the first column is the grid row and the second column is the
%       grid column
%       history - number of previous states to plot
%
%   OUTPUTS:
%       figureReturned - return the figure
    
    figure;
    hold on
    image(grid)
    if size(stateHistory,1) < history+1
        plot(stateHistory(1:end,2),stateHistory(1:end,1),'r')
    else
        plot(stateHistory(size(stateHistory,1)-history:end,2),stateHistory(size(stateHistory,1)-history:end,1),'r')    
    end
    scatter(stateHistory(end,2),stateHistory(end,1),'r')
    colorbar
    drawnow
end

