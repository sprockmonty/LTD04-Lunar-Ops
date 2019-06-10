isLearning = false;

% Begin J.ourney E.xploration reinF.orcement F.or the D.rilling O.perations T.ask script


figOn = true;
etaGreedy = 0;
close all
if isLearning
    clear
    numActions = 4;
    gridSize = 10;
    grid = ones(gridSize) * -1; %using Stochastic-shortest-path 
    %read resource and slope data
    resourceData = rgb2gray(imread('exampleResourceMap.png'));
    slopeData = rgb2gray(imread('exampleSlopeMap.png'));
    grid = grid + double(resourceData);
    
    Q = zeros(length(grid),length(grid),numActions); % up, right, down, left (clockwise)
    figOn = false;
    etaGreedy = 0.5; %chance there is a random action instead of the chosen one (set to 0 to follow Q exactly)
end
iterations = 1000;

%setup Q values

stateHistory = [1,1];
alphaRate = 1; %alpha rate is learn rate 0<alpha<1
lambda = 0.9; %discount factor 0<lambda<1 - expected amount of reward under terminating model
actionFunc = @upLeftDownRight; %select action function
fig = figure;


% Q learning function
Q = qLearn(grid, numActions, Q, stateHistory, etaGreedy, alphaRate, lambda, actionFunc, fig, figOn, iterations);



