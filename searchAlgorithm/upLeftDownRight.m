function outState = upLeftDownRight(inState, action)
%   inState is not the state history but the current state
%   1 = up
%   2 = right
%   3 = down
%   4 = left
    if action  == 1
            outState = [inState(1)+1,inState(2)]; 
    elseif action == 2
            outState = [inState(1),inState(2)+1];
    elseif action == 3
            outState = [inState(1)-1,inState(2)];
    elseif action == 4
            outState = [inState(1),inState(2)-1];
    end
end