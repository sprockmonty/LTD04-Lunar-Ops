function outState = upLeftDownRight(inState, action)
%   inState is not the state history but the current state
%   1 = up
%   2 = right
%   3 = down
%   4 = left
    switch action
        case 1
            outState = [inState(1)+1,inState(2)]; 
        case 2
            outState = [inState(1),inState(2)+1];
        case 3
            outState = [inState(1)-1,inState(2)];
        case 4
            outState = [inState(1),inState(2)-1];
    end
end