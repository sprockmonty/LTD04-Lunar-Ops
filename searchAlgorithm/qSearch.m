isLearning = false;

% Begin script


figOn = true;
etaGreedy = 0;
close all
if isLearning
    clear
    numActions = 4;
    gridSize = 10;
    grid = ones(gridSize) * -1;
    grid(2,5) = 10;
    grid(8,5) = 10;
    Q = zeros(length(grid),length(grid),numActions); % up, right, down, left (clockwise)
    figOn = false;
    etaGreedy = 0.1; %chance there is a random action instead of the chosen one (set to 0 to follow Q exactly)
end
iterations = 100000;

%setup Q values

stateHistory = [1,1];
alphaRate = 1; %alpha rate is learn rate 0<alpha<1
lambda = 0.9; %discount factor 0<lambda<1 - expected amount of reward under terminating model
actionFunc = @upLeftDownRight; %select action function
fig = figure;


% Q learning function
Q = qLearn(grid, numActions, Q, stateHistory, etaGreedy, alphaRate, lambda, actionFunc, fig, figOn, iterations);



