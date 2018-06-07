function [ blpos,blvel ] = boundcheck(blpos,blvel,res,ballsize)
%This function checks against the boundries of the game field. If the ball
%pos "blpos" is outside one of the boudries "res" it is reflected blvel=-blvel.
if blpos(1)>=res(1)-ballsize(1)
    blpos(1)=res(1)-ballsize(1);
    blvel(1)=-blvel(1);
elseif blpos(1)<=1+ballsize(1)
    blpos(1)=1+ballsize(1);
    blvel(1)=-blvel(1);
end
if blpos(2)>=res(2)-ballsize(2)
    blpos(2)=res(2)-ballsize(2);
    blvel(2)=-blvel(2);
elseif blpos(2)<=1+ballsize(2)
    blpos(2)=1+ballsize(2);
    blvel(2)=-blvel(2);
end

end

